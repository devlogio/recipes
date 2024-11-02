import 'package:flutter/material.dart';
import 'package:recipes/model/recipe.dart';

class RecipeListItem extends StatelessWidget {
  final Recipe recipe;
  const RecipeListItem({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
      child: Card(
        color: Colors.white,
        child: SizedBox(
          height: 140,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 9.0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                  child: Image(
                    image: AssetImage(recipe.image),
                    fit: BoxFit.cover,
                    width: 155.0,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        recipe.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          recipe.description,
                          style: const TextStyle(
                            color: Colors.black54,
                          ),
                        ),
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
                              Text(recipe.difficulty),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.schedule_outlined,
                                color: Colors.lightBlueAccent,
                              ),
                              Text(recipe.time),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.restaurant_menu_outlined,
                                color: Colors.redAccent,
                              ),
                              Text(recipe.serving),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
