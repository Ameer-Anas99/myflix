import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_api/constants/secret.dart';
import 'package:netflix_api/controller/home_provider.dart';
import 'package:netflix_api/helpers/colors.dart';
import 'package:netflix_api/helpers/spicing.dart';
import 'package:netflix_api/helpers/texts.dart';
import 'package:netflix_api/service/api_service.dart';
import 'package:netflix_api/widget/carousel_widget.dart';
import 'package:netflix_api/widget/movie_list_builder.dart';
import 'package:netflix_api/widget/tv_list_builder_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<HomeProvider>(context, listen: false).getMoviestoHome();
  }

  ApiService apiService = ApiService();
  ApiConstants apiConstants = ApiConstants();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: BoxDecoration(
            gradient: backgroundGradient(),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                spacingHeight(height * 0.05),
                Row(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/movie img.jpeg'))),
                      ),
                    ),
                    Text(
                      'Movies',
                      style: GoogleFonts.aBeeZee(
                          color: Colors.white, fontSize: 25),
                    ),
                  ],
                ),
                spacingHeight(20),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'Trending Movies',
                    style:
                        GoogleFonts.aBeeZee(color: Colors.white, fontSize: 20),
                  ),
                ),
                spacingHeight(20),
                CarousalWidget(height: height, width: width),
                spacingHeight(10),
                categoryTitle(text: 'Top Rated Movies'),
                MovieListBuilder(
                    movieApiService: apiService, apiUrl: apiConstants.topRated),
                spacingHeight(10),
                categoryTitle(text: 'Up Coming Movies'),
                MovieListBuilder(
                    movieApiService: apiService, apiUrl: apiConstants.upComing),
                spacingHeight(10),
                categoryTitle(text: 'Popular Movies'),
                MovieListBuilder(
                    movieApiService: apiService, apiUrl: apiConstants.popular),
                spacingHeight(10),
                categoryTitle(text: 'Top Rated TV Series List'),
                TvListBuilder(
                    tvApiService: apiService,
                    apiUrl: apiConstants.topRatedTvHome),
                spacingHeight(10),
                categoryTitle(text: 'On the Air Series List'),
                TvListBuilder(
                    tvApiService: apiService,
                    apiUrl: apiConstants.onTheAirtvHome),
              ],
            ),
          ),
        ));
  }
}
