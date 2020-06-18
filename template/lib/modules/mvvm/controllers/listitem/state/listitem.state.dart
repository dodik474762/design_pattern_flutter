

import 'package:equatable/equatable.dart';

abstract class ListItemState extends Equatable{
  const ListItemState();
}

class InitData extends ListItemState{
  const InitData();
  

  @override
  List<Object> get props => [];
}