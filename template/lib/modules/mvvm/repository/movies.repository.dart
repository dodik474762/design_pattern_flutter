

import 'package:http/http.dart' as http;
import 'package:template/modules/mvvm/models/movies.models.dart';
import 'dart:convert';
import 'package:template/routes/api.dart';

class MoviesDomain{
  final MoviesRepository moviesRepository;

  MoviesDomain(this.moviesRepository);

  Future<Movies> getMoviesPopular(){
    return moviesRepository.getPopularMovies();
  }
}


class MoviesRepository{
  Future<Movies> getPopularMovies() async{
    try{
      var response = await http.get(Api.route['dashboard']['getData']);
      return Movies.fromJson(jsonDecode(response.body));
    }catch(e){
      return e;
    }
  }
}