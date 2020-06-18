import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/modules/mvvm/controllers/listitem/bloc/lisitem.bloc.dart';

class ListItemData extends StatelessWidget {
  const ListItemData({Key key}) : super(key: key);  


  @override
  Widget build(BuildContext context) {
    ListItemBloc _blocList = new ListItemBloc();

    List data = ["dodik", "rismawan", "affrudin"];
    String default_value = "dodik";

    return Scaffold(
      appBar: AppBar(
        title: Text("DropDown Item")
      ),
      body: Container(
        child: Column(
          children: <Widget>[
           BlocBuilder(
             bloc: _blocList,
             builder: (context, state){
               return  DropdownButton(
                  value: default_value,
                  items: data.map((value) {
                    return DropdownMenuItem(
                      child: Text(value),
                      value: value,
                    );
                  }).toList(), 
                  onChanged: (val){
                    default_value = val;
                  }
              );
            }
           )
          ],
        ),
      ),
    );
  }
}