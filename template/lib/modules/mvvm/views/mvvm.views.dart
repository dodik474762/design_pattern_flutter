
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/modules/mvvm/controllers/movies/bloc/movies.bloc.dart';
import 'package:template/modules/mvvm/controllers/movies/events/movies.events.dart';
import 'package:template/modules/mvvm/controllers/movies/state/movies.state.dart';
import 'package:template/modules/mvvm/repository/movies.repository.dart';

class Mvvm extends StatefulWidget {
  Mvvm({Key key}) : super(key: key);

  @override
  _MvvmState createState() => _MvvmState();
}

class _MvvmState extends State<Mvvm> {
  MoviesBloc _moviesBloc;
  MoviesDomain _moviesDomain;

  @override
  void initState() { 
    super.initState();
    _moviesDomain = new MoviesDomain(MoviesRepository());    
    _moviesBloc = new MoviesBloc(moviesDomain: _moviesDomain);
  }


  @override
  Widget build(BuildContext context) {
    _moviesBloc.add(MoviesFetching());

    return Scaffold(
      appBar: AppBar(
        title: Text("MVVM BLOC"),
      ),
      body: BlocListener<MoviesBloc, MoviesState>(
          bloc: _moviesBloc,
          listener: (context, state){
            if(state is MoviesFetchError){
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text('${state.error}'),
                  backgroundColor: Colors.red,
                )
              );
            }
          },
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height:20
                ),
                Container(
                  child: BlocBuilder(
                    bloc: _moviesBloc,
                    builder: (context, state){
                      if(state is MoviesFetchSuccess){
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.movies.results.length,
                          itemBuilder: (BuildContext context, item){
                            return ListTile(
                              title: Text(state.movies.results[item].password),
                              subtitle: Text(state.movies.results[item].username, overflow: TextOverflow.ellipsis, maxLines: 3,softWrap: true,),
                            );
                          }
                        );
                      }else{
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }
                  ),
                ),
                 SizedBox(
                  height:20
                ),
                RaisedButton(
                  child: Text("REFRESH DATA"),
                  onPressed: (){
                    _moviesBloc.add(MoviesFetching());
                  }
                )
              ],
            ),
          )
        ),
    );
  }
}