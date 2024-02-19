import 'package:flutter/material.dart';
import 'package:netflix_api/constants/secret.dart';
import 'package:netflix_api/models/movie_model.dart';
import 'package:netflix_api/service/api_service.dart';

class HomeProvider extends ChangeNotifier {
  final ApiService movieApiService = ApiService();
  List<MovieModel>? movies = [];
  bool isloading = false;
  Future<void> getMoviestoHome() async {
    try {
      isloading = true;
      List<MovieModel> movieResults = await movieApiService.getMovies(
          apiUrl: "${ApiConstants().trending}${ApiConstants().apiKey}");
      movies = movieResults;
    } catch (error) {
      throw Exception(error);
    } finally {
      isloading = false;
      notifyListeners();
    }
  }
}
