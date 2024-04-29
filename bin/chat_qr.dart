import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_web_socket/shelf_web_socket.dart';

class User {
  late WebSocket webSocket;
  late String chatId;

  User(this.webSocket, this.chatId);
}

List<User> users = [];
List<Map<String, dynamic>> messages = [];

void main() {
  var handler = webSocketHandler((webSocket) {
    webSocket.stream.listen((message) {
      var parsedMessage = jsonDecode(message);

      if (parsedMessage.containsKey('action') && parsedMessage['action'] == 'join') {
        var chatId = parsedMessage['chatId'] as String;
        var user = User(webSocket, chatId);
        users.add(user);
        // После подключения отправляем пользователю все сообщения по указанному чату
        var chatMessages = messages.where((msg) => msg['cid'] == chatId).toList();
        user.webSocket.add(jsonEncode(chatMessages));
      } else {
        messages.add(parsedMessage);

        for (var user in users) {
          if (user.webSocket == webSocket && parsedMessage['cid'] == user.chatId) {
            user.webSocket.add(jsonEncode([parsedMessage]));
          }
        }
      }
    });
  });

  shelf_io.serve(handler, 'localhost', 8080).then((server) {
    print('Serving at ws://${server.address.host}:${server.port}');
  });
}
