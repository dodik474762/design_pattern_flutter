
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/modules/provider/controllers/provider.controller.dart';
import 'package:template/modules/provider/models/providers.models.dart';
import 'package:template/routes/navigator.dart';

class ContentProvider extends StatelessWidget {
  
  const ContentProvider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //set up controller
    ProviderController con = Provider.of<ProviderController>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("Provider State Management Example"),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Text("halooo ${ProviderModels.word}"),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                child: Text("Ganti State"),
                onPressed: (){
                  con.changeWord("ganti bos");
              }),
               SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: ProviderModels.data.length,
                  itemBuilder: (context, item){
                    return ListTile(
                      title: Text(ProviderModels.data[item]),
                    );
                }),                
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                child: Text("Add State"),
                onPressed: (){
                  Navigate.route[ProviderModels.modules]['add'](context);
              }),
            ],
          ),
        ),
      );
  }
}