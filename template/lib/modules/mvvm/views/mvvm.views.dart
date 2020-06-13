
import 'package:flutter/material.dart';

class Mvvm extends StatefulWidget {
  Mvvm({Key key}) : super(key: key);

  @override
  _MvvmState createState() => _MvvmState();
}

class _MvvmState extends State<Mvvm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MVVM BLOC"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            Text("HALOO MVVM"),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              child: Text("MVVM"),
              onPressed: (){
                print("mvvm");
            })
          ],
        )
      ),
    );
  }
}