import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:template/modules/example/controllers/example.controllers.dart';
import 'package:template/modules/example/views/add.example.views.dart';
import 'package:template/routes/routes.dart';

class ExampleView extends StatefulWidget {
  @override
  _ExampleViewState createState() => _ExampleViewState();
}

class _ExampleViewState extends State<ExampleView> {
  ExampleController _controller;

  @override
  void initState() {
    _controller = ExampleController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Example"),
      ),
      body:SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Container(
                child: Center(
                  child: GetBuilder<ExampleController>(
                    init: _controller,
                    builder: (params){
                        return Text(
                          params.result
                        );
                    },
                  )
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async{
          String result = await Get.to(AddExampleView(), arguments: {
            'username' : "Dodik Rismawan"
          });

          _controller.getResult(result);
        },
      ),
    );
  }
}
