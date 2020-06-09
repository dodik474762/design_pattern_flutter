import 'package:flutter/material.dart';
import 'package:template/modules/dashboard/controllers/dashboard.controller.dart';
import 'package:template/modules/dashboard/models/dashboard.models.dart';
import 'package:template/routes/navigator.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String modules = DashboardModels.modules;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Odimo.id"),                        
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (choice){
              if(choice == "Refresh"){
                setState(() {
                  DashboardModels.data_user = [];
                });
              }
            },
             itemBuilder: (BuildContext context){               
               return DashboardModels.more_list.map((String choice){
                 return PopupMenuItem(
                   value: choice,
                   child: Text(choice));
               }).toList();
             },
          )
        ],
      ),      
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 60,
              ),
              Text(DashboardModels.content),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                child: Text("Tes Async dan Await"),
                onPressed: () async{
                String change = await DashboardController().changeDataObject();
                print("CHANGE $change");
              }),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                child: Text("Tes Change State"),
                onPressed: () async{
                // DashboardController().getState(this);
                var txt = await DashboardController().getChangeData();
                setState(() {
                  DashboardModels.content = txt;
                });                
              }),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                child: Text("Tambah Data"),
                onPressed: () {
                Navigate.route[modules]['add'](context);
              }),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                child: Text("Get data from server"),
                onPressed: () async{
                var data = await DashboardController().getData();
                if(data.length > 0){
                  setState(() {
                    DashboardModels.data_user = data;
                  });
                }                
              }),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: ListView.builder(                  
                  shrinkWrap: true,
                  itemCount: DashboardModels.data_user.length,
                  itemBuilder: (BuildContext context, index){
                    return Text(DashboardModels.data_user[index].username);
                  }),
              )
            ],
          ),
        ),
      ),      
    );
  }
}