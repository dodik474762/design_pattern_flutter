
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/modules/mvvm/bloc/counter/events/counter.event.dart';
import 'package:template/modules/mvvm/bloc/counter/state/counter.state.dart';
import 'package:template/modules/mvvm/models/counter.models.dart';


//untuk kontrol logic dari event ke UI
class CounterBloc extends Bloc<CounterEvent, CounterState>{
    
  @override
  CounterState get initialState => InitTotal();


  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async*{
    if(event is AddOperation){    
      int total = CounterModels.number + 1000;
      yield OutputTotal(total: total);
    }
  }
}