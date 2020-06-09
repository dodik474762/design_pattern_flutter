import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:template/modules/dashboard/models/dashboard.models.dart';
import 'package:template/modules/dashboard/views/add.views.dart';

class Navigate{
  static Map route = {
    DashboardModels.modules:{
      'main': '',
      'add': (BuildContext context){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Add()));
      }
    }
  };
}