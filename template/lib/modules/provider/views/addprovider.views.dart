import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/modules/provider/controllers/provider.controller.dart';

class AddProvider extends StatelessWidget {
  const AddProvider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProviderController con = Provider.of<ProviderController>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Provider Data"),
      ),
      body: Container(
        child: Center(
          child: RaisedButton(onPressed: (){
            
          })
        ),
      ),
    );
  }
}