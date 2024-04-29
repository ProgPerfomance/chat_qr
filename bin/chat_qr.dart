import 'dart:convert';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_web_socket/shelf_web_socket.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

final Map<String, List<WebSocketChannel>> chatRooms = {}; // Хранит подключения к чатам
final Map<String, List<Map<String, dynamic>>> chatMessages = {}; // Хранит сообщения для каждого чата

void main() {
  var handler = webSocketHandler((webSocket) {
    webSocket.stream.listen((message) {
      handleMessage(webSocket, message);
    });
  });

  shelf_io.serve(handler, 'localhost', 8084).then((server) {
    print('Serving at ws://${server.address.host}:${server.port}');
  });
}

void handleMessage(WebSocketChannel socket, String message) {
  var data = json.decode(message);
  String chatId = data['chatId'];
  String userId = data['userId'];
  String text = data['text'];

  var messageModel = {
    'messageId': DateTime.now().millisecondsSinceEpoch.toString(),
    'senderId': userId,
    'text': text,
  };

  // Сохраняем сообщение в истории чата
  chatMessages.putIfAbsent(chatId, () => []).add(messageModel);
  chatRooms.putIfAbsent(chatId, () => []).add(socket);

  // Отправляем историю сообщений всем участникам чата
  for (var client in chatRooms[chatId]!) {
    client.sink.add(json.encode(chatMessages[chatId]));
  }

  // Выводим на сервере все чаты с их сообщениями
  print('Current chat states:');
  chatMessages.forEach((key, value) {
    print('Chat $key: $value');
  });
}
