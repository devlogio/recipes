import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:recipes/widgets/recipe_list_item.dart';

import '../data/recipes.dart';

class HomeView extends StatefulWidget {
  final Function openRecipe;
  const HomeView({super.key, required this.openRecipe});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final CarouselSliderController _controller = CarouselSliderController();
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 15.0),
          child: const Text(
            "Recipes",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
          ),
        ),
        Column(
          children: [
            CarouselSlider(
              items: createFeaturedRecipes(widget.openRecipe),
              carouselController: _controller,
              options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: recipes.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 8.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.black.withOpacity(_current == entry.key ? 0.9 : 0.4)),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(left: 15.0, bottom: 8.0),
          child: const Text(
            "Popular",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
        getPopularRecipes(widget.openRecipe),
      ],
    );
  }
}

List<Widget> createFeaturedRecipes(Function openRecipe) {
  final List<Widget> featuredRecipes = recipes
      .map((recipe) => GestureDetector(
            onTap: () {
              openRecipe(recipe.title);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Image(
                        image: AssetImage(recipe.image),
                        fit: BoxFit.cover,
                        width: 500.0,
                      ),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color.fromARGB(200, 0, 0, 0), Color.fromARGB(0, 0, 0, 0)],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                          child: Text(
                            recipe.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ))
      .toList();
  return featuredRecipes;
}

Widget getPopularRecipes(Function openRecipe) {
  List<Widget> popularRecipes = [];
  for (var recipe in recipes) {
    popularRecipes.add(
      GestureDetector(
        onTap: () {
          openRecipe(recipe.title);
        },
        child: RecipeListItem(
          recipe: recipe,
        ),
      ),
    );
  }
  return Column(
    children: popularRecipes,
  );
}
