import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:template/config/pattern.dart';
import 'package:template/config/register.dart';
import 'package:template/modules/dashboard/views/dashboard.views.dart';
import 'package:template/modules/example/views/example.views.dart';
import 'package:template/modules/mvvm/views/counter.views.dart';
import 'package:template/modules/mvvm/views/mvvm.views.dart';
import 'package:template/modules/provider/controllers/provider.controller.dart';
import 'package:template/modules/provider/views/provider.views.dart';
import 'package:template/modules/transactions/views/trasactions.view.dart';
import 'package:template/modules/verifikasibhnbaku/views/verifikasi.views.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    if(Pattern.config == Pattern.bloc){
      //Bloc Pattern
      return MultiBlocProvider(
        providers: Register.blocproviders, 
        child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Example',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: ExampleView()
          ), 
      );
    }else{
    //Provider Pattern
    return MultiProvider(
          providers: Register.stateproviders,
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Example',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: Mvvm()
          ),
        );
      }
    }    
}

