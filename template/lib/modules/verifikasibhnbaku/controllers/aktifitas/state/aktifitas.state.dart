

import 'package:equatable/equatable.dart';

abstract class AktifitasState extends Equatable{
  const AktifitasState();
}

class InitData extends AktifitasState{
  const InitData();

  @override
  List<Object> get props => [""];
}

class OutputAktifitas extends AktifitasState{
  String aktifitas;
  OutputAktifitas({this.aktifitas});

  @override
  List<Object> get props => [aktifitas];
}