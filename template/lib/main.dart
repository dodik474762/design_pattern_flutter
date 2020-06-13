import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/config/register.dart';
import 'package:template/modules/dashboard/views/dashboard.views.dart';
import 'package:template/modules/mvvm/views/mvvm.views.dart';
import 'package:template/modules/provider/controllers/provider.controller.dart';
import 'package:template/modules/provider/views/provider.views.dart';
import 'package:template/modules/transactions/views/trasactions.view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: Register.providers,
      child: MaterialApp(
        title: 'Odimo.id',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Mvvm()
      ),
    );
  }
}

