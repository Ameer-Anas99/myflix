import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_api/models/movie.dart';
import 'package:netflix_api/service/api_service.dart';
import 'package:netflix_api/widget/movie_slider.dart';
import 'package:netflix_api/widget/trending_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Movie>> trendingMovies;

  @override
  void initState() {
    super.initState();
    trendingMovies = Api().getTrendingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 28, 24, 24),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset(
          "assets/netflix.png",
          fit: BoxFit.cover,
          height: 170,
          filterQuality: FilterQuality.high,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Trending Movies",
                style: GoogleFonts.aBeeZee(fontSize: 25, color: Colors.amber),
              ),
              const SizedBox(
                height: 30,
              ),
              const TrendingSlider(),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Top rated movies",
                style: GoogleFonts.aBeeZee(fontSize: 25, color: Colors.amber),
              ),
              const MovieSlider(),
              const SizedBox(
                height: 30,
              ),
              Text(
                "upcoming movies",
                style: GoogleFonts.aBeeZee(fontSize: 25, color: Colors.amber),
              ),
              const MovieSlider(),
              const SizedBox(height: 30),
              Text(
                "upcoming movies",
                style: GoogleFonts.aBeeZee(fontSize: 25, color: Colors.amber),
              ),
              const MovieSlider(),
            ],
          ),
        ),
      ),
    );
  }
}
