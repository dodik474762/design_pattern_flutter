
import 'package:flutter/material.dart';
import 'package:template/config/socket.dart';
import 'package:template/config/url.dart';
import 'package:flutter_socket_io/flutter_socket_io.dart';
import 'package:flutter_socket_io/socket_io_manager.dart';
import 'dart:convert';


class VerifikasiBhnBaku extends StatefulWidget {
  VerifikasiBhnBaku({Key key}) : super(key: key);

  @override
  _VerifikasiBhnBakuState createState() => _VerifikasiBhnBakuState();
}

class _VerifikasiBhnBakuState extends State<VerifikasiBhnBaku> {

  SocketIO socketIO;

  @override
  void initState() {  
    WebSocketConfig.init();
    WebSocketConfig.socketIO.subscribe('scan', (data){
      var result = json.decode(data);
      print(result['aktifitas']);  
    });
    super.initState();    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("Verifikasi Bahan Baku"),
       ),
       body: Container(

       ),
       floatingActionButton: FloatingActionButton(
         child: Icon(Icons.refresh),
         onPressed: (){
           
         }
       ),
    );
  }
}