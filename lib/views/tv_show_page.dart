import 'package:flutter/material.dart';
import 'package:netflix_api/constants/secret.dart';
import 'package:netflix_api/helpers/colors.dart';
import 'package:netflix_api/helpers/spicing.dart';
import 'package:netflix_api/helpers/texts.dart';
import 'package:netflix_api/service/api_service.dart';
import 'package:netflix_api/widget/tv_list_builder_widget.dart';

// ignore: must_be_immutable
class TvShowsPage extends StatelessWidget {
  TvShowsPage({super.key});
  ApiService apiService = ApiService();
  ApiConstants apiConstants = ApiConstants();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(gradient: backgroundGradient()),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                spacingHeight(50),
                categoryTitle(text: 'Trending Tv Shows'),
                spacingHeight(20),
                TvListBuilder(
                    tvApiService: apiService, apiUrl: apiConstants.tvList),
                spacingHeight(20),
                categoryTitle(text: 'On The Air Now'),
                TvListBuilder(
                    tvApiService: apiService, apiUrl: apiConstants.onAirTVList),
                spacingHeight(20),
                categoryTitle(text: 'Popular Tv Shows'),
                TvListBuilder(
                    tvApiService: apiService,
                    apiUrl: apiConstants.popularTvSeriesTv)
              ],
            ),
          ),
        ));
  }
}
