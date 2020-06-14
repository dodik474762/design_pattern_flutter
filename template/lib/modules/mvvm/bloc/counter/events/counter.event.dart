

import 'package:equatable/equatable.dart';


//event untuk kontrol kejadian dari user ex: klik, saat mengetik, dll
abstract class CounterEvent extends Equatable{
  const CounterEvent();

  @override
  List<Object> get props => [];
}


class AddOperation extends CounterEvent{}

class MinusOperation extends CounterEvent{}