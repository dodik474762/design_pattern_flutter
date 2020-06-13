
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/modules/mvvm/bloc/movies/events/movies.events.dart';
import 'package:template/modules/mvvm/bloc/movies/state/movies.state.dart';
import 'package:template/modules/mvvm/models/movies.models.dart';
import 'package:template/modules/mvvm/repository/movies.repository.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState>{
  final MoviesDomain moviesDomain;

  
  MoviesBloc({@required this.moviesDomain}) : assert(moviesDomain != null);

  @override
  MoviesState get initialState => MoviesFetchLoading();

  @override
  Stream<MoviesState> mapEventToState(MoviesEvent event) async*{
    if(event is MoviesFetching){
      yield MoviesFetchLoading();

      try{
        Movies movies = await this.moviesDomain.getMoviesPopular();
        yield MoviesFetchSuccess(movies: movies);
      }catch(e){
        yield MoviesFetchError(error: e.toString());
      }
    }
  }
}