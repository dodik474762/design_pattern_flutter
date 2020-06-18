

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/modules/mvvm/controllers/listitem/event/listitem.event.dart';
import 'package:template/modules/mvvm/controllers/listitem/state/listitem.state.dart';

class ListItemBloc extends Bloc<ListItemEvent, ListItemState>{

  @override
  ListItemState get initialState => InitData();


  @override
  Stream<ListItemState> mapEventToState(ListItemEvent event) async*{

  }
}