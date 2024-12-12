import 'package:flutter/material.dart';
import 'package:mooviee/app_route.dart';

void main() {
  runApp(MaterialApp(
    onGenerateRoute: AppRoute().generateRoute,
  ));
  
}
class Movie extends StatelessWidget {
  final AppRoute appRoute;

  const Movie({super.key, required this.appRoute});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRoute.generateRoute,
    );
  }
}

