import 'package:flutter/material.dart';
import 'package:recipes/model/recipe.dart';

class RecipeView extends StatelessWidget {
  final Function back;
  final Recipe? recipe;
  const RecipeView({super.key, required this.back, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20.0, left: 20.0),
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: GestureDetector(
              onTap: () {
                back('home', null);
              },
              child: Container(
                margin: const EdgeInsets.only(
                  top: 10.0,
                  left: 10.0,
                ),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(150, 255, 255, 255),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Icon(Icons.arrow_back_ios_new),
              ),
            ),
            flexibleSpace: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(15.0),
              ),
              child: Image(
                image: AssetImage(recipe!.image),
                fit: BoxFit.cover,
              ),
            ),
            expandedHeight: 300.0,
            backgroundColor: Colors.white,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe!.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.emoji_events_outlined,
                            color: Colors.orangeAccent,
                          ),
                          Text(
                            recipe!.difficulty,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.schedule_outlined,
                            color: Colors.lightBlueAccent,
                          ),
                          Text(
                            recipe!.time,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.restaurant_menu_outlined,
                            color: Colors.redAccent,
                          ),
                          Text(
                            recipe!.serving,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Ingredients',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  _getIngredientsList(recipe!.ingredients),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Directions',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  _getDirectionsList(recipe!.directions),
                ],
              ),
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}

Widget _getIngredientsList(List<String> ingredients) {
  List<Widget> ingredientsList = [];

  for (var ingredient in ingredients) {
    ingredientsList.add(
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '\u2022',
            style: TextStyle(fontSize: 16, color: Colors.black54, height: 1.55),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Text(
              '$ingredient',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: ingredientsList,
  );
}

Widget _getDirectionsList(List<String> directions) {
  List<Widget> directionList = [];

  for (int i = 1; i <= directions.length; i++) {
    directionList.add(
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$i',
            style: const TextStyle(
              fontSize: 30,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Text(
              directions[i - 1],
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );

    directionList.add(
      const SizedBox(
        height: 5,
      ),
    );

    directionList.add(
      const Divider(),
    );

    directionList.add(
      const SizedBox(
        height: 5,
      ),
    );
  }

  directionList.removeLast();
  directionList.removeLast();

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: directionList,
  );
}
