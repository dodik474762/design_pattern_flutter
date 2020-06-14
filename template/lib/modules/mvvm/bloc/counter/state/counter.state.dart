

import 'package:equatable/equatable.dart';


//State untuk kontrol output pada UI
abstract class CounterState extends Equatable{
  const CounterState();
}


class InitTotal extends CounterState{
  const InitTotal();

  @override
  List<Object> get props => [0];
}

class OutputTotal extends CounterState{
  int total;

  OutputTotal({this.total});

  @override
  List<Object> get props => [total];  
}