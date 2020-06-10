import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:template/modules/dashboard/models/dashboard.models.dart';
import 'package:template/modules/dashboard/views/add.views.dart';
import 'package:template/modules/provider/models/providers.models.dart';
import 'package:template/modules/provider/views/addprovider.views.dart';
import 'package:template/modules/provider/views/provider.views.dart';
import 'package:template/modules/transactions/views/trasactions.view.dart';

//Untuk Routing Navigation per Modules
class Navigate{
  static Map route = {
    DashboardModels.modules:{
      'main': '',
      'add': (BuildContext context){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Add()));
      },
      'transactions': (BuildContext context){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Transactions()));
      },
      'provider' :(BuildContext context){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> ProviderView()));
      }
    },
    ProviderModels.modules:{
      'add':(BuildContext context){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> AddProvider()));
      }
    }
  };
}