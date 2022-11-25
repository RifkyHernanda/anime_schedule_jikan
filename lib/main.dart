import 'package:flutter/material.dart';
import 'package:tugas_besar/profile.dart';

import 'detail.dart';
import 'home.dart';
import 'navigation.dart';
import 'splash.dart';

void main() async {
  runApp(const AnimeApp());
}

class AnimeApp extends StatelessWidget {
  const AnimeApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anime Schedule App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/nav': (context) => const Navigation(),
        '/home': (context) => const HomePage(),
        '/detail': (context) => const DetailPage(item: 0, title: ''),
        '/profile': (context) => ProfilePage(),
      },
    );
  }
}
