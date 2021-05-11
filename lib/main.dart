import 'package:flutter/material.dart';
import 'package:flutter_github_search/providers/search_provider.dart';
import 'package:flutter_github_search/screens/search_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.route,
      routes: {
        HomeScreen.route: (context) => ChangeNotifierProvider<SearchProvider>(
              create: (context) => SearchProvider(),
              child: HomeScreen(),
            ),
      },
    );
  }
}
