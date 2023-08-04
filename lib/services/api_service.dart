import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/movie_detail_model.dart';
import 'package:toonflix/models/movie_model.dart';

class ApiService {
  static const String baseUrl = 'https://movies-api.nomadcoders.workers.dev';
  static const String popular = 'popular';
  static const String now = 'now-playing';
  static const String coming = 'coming-soon';
  static const String imageUrl = 'https://image.tmdb.org/t/p/w500';

  static Future<List<MovieModel>> getPopluarMovies() async {
    Set<MovieModel> moviesInstances = {};
    final url = Uri.parse('$baseUrl/$popular');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final movies = jsonDecode(response.body);
      for (var movie in movies) {
        moviesInstances.add(
          MovieModel.fromJson(
            movie,
          ),
        );
      }
      return moviesInstances;
    }
    throw Error();
  }

  static Future<List<MovieModel>> getNowMovies() async {
    List<MovieModel> moviesInstances = [];
    final url = Uri.parse('$baseUrl/$now');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> movies = jsonDecode(response.body);
      for (var movie in movies) {
        moviesInstances.add(
          MovieModel.fromJson(
            movie,
          ),
        );
      }
      return moviesInstances;
    }
    throw Error();
  }

  static Future<List<MovieModel>> getComingMovies() async {
    List<MovieModel> moviesInstances = [];
    final url = Uri.parse('$baseUrl/$coming');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> movies = jsonDecode(response.body);
      for (var movie in movies) {
        moviesInstances.add(
          MovieModel.fromJson(
            movie,
          ),
        );
      }
      return moviesInstances;
    }
    throw Error();
  }

  static Future<MovieDetailModel> getMovieById(String id) async {
    final url = Uri.parse('$baseUrl/movie?id=$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final movie = jsonDecode(response.body);
      return MovieDetailModel.fromJson(movie);
    }
    throw Error();
  }
}
