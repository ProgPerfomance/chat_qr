import 'dart:convert';

import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_web_socket/shelf_web_socket.dart';

List<Map<String, dynamic>> users = [];
List<Map<String, dynamic>> messages = [];

void main() {
  var handler = webSocketHandler((webSocket) {
    webSocket.stream.listen((message) {
      // При получении сообщения от клиента
      var parsedMessage = jsonDecode(message);

      // Если сообщение содержит информацию о новом пользователе
      if (parsedMessage.containsKey('action') && parsedMessage['action'] == 'join') {
        // Добавляем пользователя в список
        users.add({
          'webSocket': webSocket,
          // Можно также сохранить какие-то другие данные о пользователе
        });
      } else {
        // Добавляем сообщение в список
        messages.add(parsedMessage);

        // Отправляем сообщение всем подписчикам, кроме отправителя
        for (var user in users) {
          if (user['webSocket'] != webSocket) {
            // Фильтруем сообщения для отправки только тем, кто находится в одном чате
            var sortedMessages = messages.where((m) => m['cid'] == parsedMessage['cid']).toList();
            user['webSocket'].sink.add(jsonEncode(sortedMessages));
          }
        }
      }
    });
  });

  shelf_io.serve(handler, 'localhost', 8080).then((server) {
    print('Serving at ws://${server.address.host}:${server.port}');
  });
}
