import 'dart:convert';

import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_web_socket/shelf_web_socket.dart';

List users =[];
List messages=[{
  'uid': '1',
  'message': 'fgjudfijidfifdid',
  'cid': '3',
  'requestType': 'message', //init
},{
  'uid': '1',
  'message': 'fgjudfijidfifdid',
  'cid': '4',
  'requestType': 'message', //init
}];
void main() {
  var handler = webSocketHandler((webSocket) {
    webSocket.stream.listen((message) {

      messages.add(jsonDecode(message));
      List sort = List.from(messages.where((element) => element['cid'] == jsonDecode(message)['cid']));
      webSocket.sink.add("echo $sort");

    });
  });

  shelf_io.serve(handler, 'localhost', 8080).then((server) {
    print('Serving at ws://${server.address.host}:${server.port}');
  });
}