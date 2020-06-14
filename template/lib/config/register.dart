

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:template/modules/dashboard/controllers/dashboard.controller.dart';
import 'package:template/modules/mvvm/bloc/counter/bloc/counter.bloc.dart';
import 'package:template/modules/mvvm/bloc/movies/bloc/movies.bloc.dart';
import 'package:template/modules/provider/controllers/provider.controller.dart';




//untuk registrasi controller , jika controller tidak diregistrasi di sini maka tidak akan jalan
class Register{

  //state providers
  static List<SingleChildWidget> stateproviders = [
    ChangeNotifierProvider(create: (context)=> ProviderController()),
    ChangeNotifierProvider(create: (context)=> DashboardController()),
  ];


  //bloc providers
  static var blocproviders = [
    BlocProvider<MoviesBloc>(create: (BuildContext context) => MoviesBloc(),),
    BlocProvider<CounterBloc>(create: (BuildContext context) => CounterBloc(),)
  ];
}