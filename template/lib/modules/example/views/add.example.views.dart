
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class AddExampleView extends StatelessWidget {
//  Map<String, dynamic> params = Get.arguments;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> params = Get.arguments == null ? "" : Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Data Example"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20,),
              Container(
                child: Center(
                  child: Text("Dari ${params['username']}"),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                child: Center(
                  child: RaisedButton(
                    child: Text("Proses"),
                    onPressed: (){
                      Get.back(result: "SUKSES BRO");
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
