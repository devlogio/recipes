import 'package:flutter/material.dart';
import 'package:recipes/ui/home_view.dart';
import 'package:recipes/ui/recipe_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _view = 'home';

  void changeView(String newView) {
    setState(() {
      _view = newView;
    });
  }

  Widget _getView() {
    if (_view == 'home') {
      return HomeView(
        openRecipe: changeView,
      );
    } else {
      return RecipeView(
        back: changeView,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: _getView(),
        ),
      ),
    );
  }
}
