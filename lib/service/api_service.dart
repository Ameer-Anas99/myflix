import 'package:dio/dio.dart';
import 'package:netflix_api/models/movie_model.dart';

class ApiService {
  Dio dio = Dio();
  Future<List<MovieModel>> getMovies({required String apiUrl}) async {
    var url = apiUrl;
    try {
      Response response = await dio.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonList = response.data;
        List<dynamic> movies = jsonList["results"];
        return movies.map((json) {
          return MovieModel.fromJson(json);
        }).toList();
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (error) {
      throw Exception('Failed to load Movies: $error');
    }
  }
}
