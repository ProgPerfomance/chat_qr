import 'dart:convert';
import 'package:mysql_client/mysql_client.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf_web_socket/shelf_web_socket.dart';

List<Map<String, dynamic>> users = [];
List<Map<String, dynamic>> messages = [];

void main() async {
  var sql = await MySQLConnection.createConnection(
      host: 'localhost',
      port: 3306,
      userName: 'root',
      password: '1234567890',
      databaseName: 'qr_chats');
  await sql.connect(timeoutMs: 99999999999);
  var handler = webSocketHandler((webSocket) {
    webSocket.stream.listen((message) async {
      // При получении сообщения от клиента
      var parsedMessage = jsonDecode(message);

      // Если сообщение содержит информацию о новом пользователе
      if (parsedMessage.containsKey('action') &&
          parsedMessage['action'] == 'join') {
        users.add({
          'webSocket': webSocket,
          'cid': parsedMessage['cid'],
        });
        List sortedMessages = List.from(
            messages.where((element) => element['cid'] == users.last['cid']));
        users.last['webSocket'].sink.add(jsonEncode(sortedMessages));
      } else {
        // Добавляем сообщение в список
        messages.add(parsedMessage);
        var resul = await sql.execute(
          "SELECT * FROM messages",
        );
        String id = resul.rows.last.assoc()['id'] as String;
        int idInt = int.parse(id);
        sql.execute("insert into messages (id, chat_id, uid, message) values (${idInt+1}, ${parsedMessage['cid']}, '${parsedMessage['uid']}','${parsedMessage['text']}')");
        // Отправляем сообщение всем подписчикам, кроме отправителя
        for (var user in users) {
          // Фильтруем сообщения для отправки только тем, кто находится в одном чате
          var sortedMessages =
              messages.where((m) => m['cid'] == parsedMessage['cid']).toList();
          user['webSocket'].sink.add(jsonEncode(sortedMessages));
        }
      }
    });
  });
  final response = await sql.execute("select * from messages");
  for (var item in response.rows) {
    messages.add({
      'id': item.assoc()['id'],
      'cid': item.assoc()['chat_id'],
      'uid': item.assoc()['uid'],
      'text': item.assoc()['message'],
    });
  }
  shelf_io.serve(handler, '63.251.122.116', 2308).then((server) {
    print('Serving at ws://${server.address.host}:${server.port}');
  });
  httpServer(sql);
}

void httpServer(sql) async {
  Router router = Router();
  router.post('/createChat', (Request request) async {
    var json = await request.readAsString();
    var data = await jsonDecode(json);
  //  final chat = await sql.execute("select * from users_chat where ");
    var resul = await sql.execute(
      "SELECT * FROM chats",
    );
    String id = resul.rows.last.assoc()['id'] as String;
    int idInt = int.parse(id);
    sql.execute(
        "insert into chats (id, admin_uid, type) values (${idInt + 1}, ${data['admin_uid']}, ${data['type']})");
    List users = data['users'];
    for (var item in users) {
      var usersCount = await sql.execute(
        "SELECT * FROM users_chat",
      );
      String pid = usersCount.rows.last.assoc()['id'] as String;
      int uidInt = int.parse(pid);
      sql.execute(
          "insert into users_chat (id, chat_id, uid) values (${uidInt + 1}, ${idInt + 1}, '$item')");
    }
    return Response.ok(jsonEncode({'chat_id': idInt + 1}));
  });
  router.post('/getChats', (Request request) async {
    var json = await request.readAsString();
    var data = await jsonDecode(json);
    List chats = [];
    final response = await sql
        .execute("select * from users_chat where uid ='${data['uid']}'");
    for (var item in response.rows) {
      var data = item.assoc();
      try {
        final lastMessageRow = await sql.execute(
            "select * from messages where chat_id = ${data['chat_id']}");
        chats.add({
          'id': data['chat_id'],
          'message': lastMessageRow.rows.last.assoc()['text'],
        });
      } catch(e) {
        chats.add({
          'id': data['chat_id'],
          'message': 'Нет сообщений'//lastMessageRow.rows.last.assoc()['text'],
        });
      }
    }
    return Response.ok(jsonEncode(chats));
  });
  serve(router, '63.251.122.116', 2314);
}
