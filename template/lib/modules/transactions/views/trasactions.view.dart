import 'package:flutter/material.dart';
import 'package:template/modules/transactions/controllers/transactions.controller.dart';
import 'package:template/modules/transactions/models/transactions.models.dart';


class Transactions extends StatefulWidget {
  @override
  _TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  String modules = TransactionsModel.modules;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transactions"),
      ),
      body:Column(
        children: <Widget>[
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo){
                if(!TransactionsModel.isLoading && scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent){
                  setState(() {
                    TransactionsModel.isLoading = true;
                  });

                  TransactionsController.loadData().then((data){
                    setState(() {
                      TransactionsModel.items.addAll(data);
                      TransactionsModel.isLoading = false;
                    });
                  });
                }

                return true;
              },
              child: ListView.builder(
                  itemCount: TransactionsModel.items.length,
                  itemBuilder: (context, index){
                    return ListTile(
                      title: Text('${TransactionsModel.items[index]}'),
                    );
                  }),
            ),
          ),
          Container(
            height: TransactionsModel.isLoading ? 50.0 : 0,
            color: Colors.transparent,
            child: Center(
              child: new CircularProgressIndicator(),
            ),
          ),

        ],
      )
    );
  }
}
