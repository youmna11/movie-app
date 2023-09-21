import 'dart:convert';
import '../../../models/movie.dart';
import 'package:http/http.dart' as http;


class Api{
  static const _newReleasesUrl=
      'https://api.themoviedb.org/3/trending/movie/day?language=en-US&api_key=6fa5fa35c3758795fc339ccfb9bc7d07';
  static const _topRatedUrl=
      'https://api.themoviedb.org/3/movie/top_rated?language=en-US&api_key=6fa5fa35c3758795fc339ccfb9bc7d07';
  static const _popularUrl=
      'https://api.themoviedb.org/3/trending/movie/day?language=en-US&api_key=6fa5fa35c3758795fc339ccfb9bc7d07';

  Future<List<Results>> getNewReleasesMovies() async{
    final response=await http.get(Uri.parse(_newReleasesUrl));
    if(response.statusCode==200){
      final decodedData=json.decode(response.body)['results'] as List;
      print(decodedData);
      return decodedData.map((movie) => Results.fromJson(movie)).toList();
    }else{
      throw Exception('Somthing happend');
    }
  }
  Future<List<Results>> getTopRatedMovies() async{
    final response=await http.get(Uri.parse(_topRatedUrl));
    if(response.statusCode==200){
      final decodedData=json.decode(response.body)['results'] as List;
      print(decodedData);
      return decodedData.map((movie) => Results.fromJson(movie)).toList();
    }else{
      throw Exception('Somthing happend');
    }
  }
  Future<List<Results>> getPopularMovies() async{
    final response=await http.get(Uri.parse(_popularUrl));
    if(response.statusCode==200){
      final decodedData=json.decode(response.body)['results'] as List;
      print(decodedData);
      return decodedData.map((movie) => Results.fromJson(movie)).toList();
    }else{
      throw Exception('Somthing happend');
    }
  }
}