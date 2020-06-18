
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/modules/mvvm/controllers/counter/bloc/counter.bloc.dart';
import 'package:template/modules/mvvm/controllers/counter/events/counter.event.dart';
import 'package:template/modules/mvvm/controllers/counter/state/counter.state.dart';
import 'package:template/modules/mvvm/models/counter.models.dart';


class Counter extends StatefulWidget {
  Counter({Key key}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  CounterBloc _counterBloc;


  @override
  void initState() { 
    super.initState();
    _counterBloc = new CounterBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter Example"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),            
            Center(
              child: BlocBuilder(
                bloc: _counterBloc,
                builder: (context, state){
                if(state is OutputTotal){
                  return Text(state.total.toString(), style: TextStyle(fontSize: 34));
                }

                return Text("0", style: TextStyle(fontSize: 34));
              }),
            ),
            SizedBox(
              height: 20,
            ),            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          CounterModels.number = 100;
          _counterBloc.add(AddOperation());
        }
      ),
    );
  }
}