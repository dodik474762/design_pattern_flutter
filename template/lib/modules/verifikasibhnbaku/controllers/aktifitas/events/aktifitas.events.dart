import 'package:equatable/equatable.dart';

abstract class AktifitasEvent extends Equatable {
  const AktifitasEvent();

  @override
  List<Object> get props => [];
}

class PerbaharuiAktifitas extends AktifitasEvent {}

class GetDataSopirMasukUntukPenerimaan extends AktifitasEvent {}
