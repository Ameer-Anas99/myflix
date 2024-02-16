import 'package:flutter/material.dart';
import 'package:netflix_api/constants/secret.dart';
import 'package:netflix_api/models/movie_model.dart';
import 'package:netflix_api/service/api_service.dart';
import 'package:netflix_api/widget/tv_card_widget.dart';

class TvListBuilder extends StatelessWidget {
  final ApiService tvApiService;
  final String apiUrl;
  const TvListBuilder({
    super.key,
    required this.tvApiService,
    required this.apiUrl,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovieModel>>(
      future: tvApiService.getMovies(apiUrl: '$apiUrl${ApiConstants().apiKey}'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Text('No Tv Series Available');
        } else {
          List<MovieModel> onTheAirList = snapshot.data!;
          return TvCardWidget(movies: onTheAirList);
        }
      },
    );
  }
}
