import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:template/modules/dashboard/controllers/dashboard.controller.dart';
import 'package:template/modules/mvvm/controllers/counter/bloc/counter.bloc.dart';
import 'package:template/modules/mvvm/controllers/listitem/bloc/lisitem.bloc.dart';
import 'package:template/modules/mvvm/controllers/movies/bloc/movies.bloc.dart';
import 'package:template/modules/provider/controllers/provider.controller.dart';
import 'package:template/modules/verifikasibhnbaku/controllers/aktifitas/bloc/aktifitas.bloc.dart';
import 'package:template/modules/verifikasibhnbaku/controllers/scanner/bloc/scanner.bloc.dart';

//untuk registrasi controller , jika controller tidak diregistrasi di sini maka tidak akan jalan
class Register {
  //state providers
  static List<SingleChildWidget> stateproviders = [
    ChangeNotifierProvider(create: (context) => ProviderController()),
    ChangeNotifierProvider(create: (context) => DashboardController()),
  ];

  //bloc providers
  static var blocproviders = [
    BlocProvider<MoviesBloc>(
      create: (BuildContext context) => MoviesBloc(),
    ),
    BlocProvider<CounterBloc>(
      create: (BuildContext context) => CounterBloc(),
    ),
    BlocProvider<ListItemBloc>(
      create: (BuildContext context) => ListItemBloc(),
    ),
    BlocProvider<AktifitasBloc>(
      create: (BuildContext context) => AktifitasBloc(),
    ),
    BlocProvider<ScannerBloc>(
      create: (BuildContext context) => ScannerBloc(),
    ),
  ];
}
