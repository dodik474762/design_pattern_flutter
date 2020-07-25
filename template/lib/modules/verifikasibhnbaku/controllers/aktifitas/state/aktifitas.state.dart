import 'package:equatable/equatable.dart';

abstract class AktifitasState extends Equatable {
  const AktifitasState();
}

class InitData extends AktifitasState {
  const InitData();

  @override
  List<Object> get props => [""];
}

class OutputAktifitas extends AktifitasState {
  String aktifitas;
  OutputAktifitas({this.aktifitas});

  @override
  List<Object> get props => [aktifitas];
}

class BeforeRetrievingDataSopir extends AktifitasState {
  @override
  List<Object> get props => [];
}

class RetrievingDataSopirFailed extends AktifitasState {
  String error;
  RetrievingDataSopirFailed({this.error});

  @override
  List<Object> get props => [error];
}

class RetrievingDataSopirSuccess extends AktifitasState {
  Map result;
  RetrievingDataSopirSuccess({this.result});

  @override
  List<Object> get props => [result];
}
