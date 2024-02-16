import 'package:flutter/material.dart';
import 'package:netflix_api/controller/bottom_bar_provider.dart';
import 'package:netflix_api/controller/home_provider.dart';
import 'package:netflix_api/controller/search_provider.dart';
import 'package:netflix_api/views/splash.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider()),
        ChangeNotifierProvider(create: (context) => SearchProvider()),
        ChangeNotifierProvider(create: (context) => BottomBarProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
