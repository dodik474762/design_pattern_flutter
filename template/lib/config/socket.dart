import 'package:flutter_socket_io/flutter_socket_io.dart';
import 'package:flutter_socket_io/socket_io_manager.dart';
import 'package:template/config/url.dart';

class WebSocketConfig {
  static SocketIO socketIO;

  static void init(){
    socketIO = SocketIOManager().createSocketIO(Url.websocketurl, '/');
    socketIO.init();    
    socketIO.connect();
  }
}