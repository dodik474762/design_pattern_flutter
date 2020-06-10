import 'package:flutter/material.dart';
import 'package:template/modules/dashboard/views/dashboard.views.dart';
import 'package:template/modules/transactions/views/trasactions.view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Odimo.id',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Dashboard()
    );
  }
}

