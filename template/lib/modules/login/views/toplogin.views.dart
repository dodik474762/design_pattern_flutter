import 'package:flutter/material.dart';

class TopLoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30, right: 32, top: 45),
      child: Row(
        children: <Widget>[
          Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Selamat Datang,", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: 5,
                  ),
                  Text("WONOKOYO GROUP ", style: TextStyle(fontSize: 16),),
                ],
              )
          ),
          Spacer(),
          Text("Masuk", style: TextStyle(fontSize: 18, color: Colors.pinkAccent),),
        ],
      ),
    );
  }
}
