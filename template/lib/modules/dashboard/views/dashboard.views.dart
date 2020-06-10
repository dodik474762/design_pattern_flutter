import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:template/helpers/pagination.dart';
import 'package:template/helpers/session.dart';
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
                  DashboardModels.datauser = [];
                });
              }
            },
             itemBuilder: (BuildContext context){               
               return DashboardModels.morelist.map((String choice){
                 return PopupMenuItem(
                   value: choice,
                   child: Text(choice));
               }).toList();
             },
          )
        ],
      ),      
      body: SingleChildScrollView(
        child: Container(
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
                          DashboardModels.datauser = data;
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
                      itemCount: DashboardModels.datauser.length,
                      itemBuilder: (BuildContext context, index){
                        return Text(DashboardModels.datauser[index].username);
                      }),
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                    child: Text("Set Pagination"),
                    onPressed: ()async {
                      List<String> data = ['dodik', 'rismawan', 'affrudin'];
                      Pagination(limit: 1, total: data.length).create(data);
                    }),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                    child: Text("Set Session"),
                    onPressed: ()async {
                      await Session.push("counter", "1999");
                      await Session.push("operate", "plus");
                    }),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                    child: Text("Get Session"),
                    onPressed: ()async {
                      String counter = await Session.pull(Session.counter);
                      if(counter != null){
                        print("counter sekarang $counter");
                      }else{
                        print("counter sekarang kosong ndan");
                      }
                    }),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                    child: Text("Hapus Session"),
                    onPressed: ()async {
                      await Session.remove(Session.counter);
                    }),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                    child: Text("Goto Transaction"),
                    onPressed: () {
                        Navigate.route[modules]['transactions'](context);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}