import 'package:flutter/material.dart';
import 'package:netflix_api/constants/secret.dart';
import 'package:netflix_api/models/movie_model.dart';
import 'package:netflix_api/service/api_service.dart';
import 'package:netflix_api/widget/movie_card.dart';

class MovieListBuilder extends StatelessWidget {
  final ApiService movieApiService;
  final String apiUrl;

  const MovieListBuilder({
    Key? key,
    required this.movieApiService,
    required this.apiUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovieModel>>(
      future:
          movieApiService.getMovies(apiUrl: '$apiUrl${ApiConstants().apiKey}'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Text('No movies available.');
        } else {
          List<MovieModel> movies = snapshot.data!;
          return MovieCardWidget(movies: movies);
        }
      },
    );
  }
}
