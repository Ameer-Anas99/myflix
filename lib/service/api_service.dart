import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:netflix_api/constants.dart';
import 'package:netflix_api/models/movie.dart';

class Api {
  static const _trendingUrl =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apikey}';

  Future<List<Movie>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(_trendingUrl));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      print(decodeData);
      return decodeData.map((movie) => Movie.fromjson(movie)).toList();
    } else {
      throw Exception("Something happend");
    }
  }
}
