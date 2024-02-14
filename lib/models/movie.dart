import 'package:flutter/material.dart';

class Movie {
  String title;
  String backDropPath;
  String orginalTitle;
  String overview;
  String posterPath;
  String releaseDate;
  String voteAverage;

  Movie(
      {required this.title,
      required this.backDropPath,
      required this.orginalTitle,
      required this.overview,
      required this.posterPath,
      required this.releaseDate,
      required this.voteAverage});

  factory Movie.fromjson(Map<String, dynamic> json) {
    return Movie(
        title: json["title"],
        backDropPath: json["backdrop_path"],
        orginalTitle: json["orgina_title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        releaseDate: json["release_date"],
        voteAverage: json["vote_Average"]);
  }
}
