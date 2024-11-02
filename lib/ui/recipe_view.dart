import 'package:flutter/material.dart';

class RecipeView extends StatelessWidget {
  final Function back;
  const RecipeView({super.key, required this.back});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20.0, left: 20.0),
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: GestureDetector(
              onTap: () {
                back('home');
              },
              child: Container(
                margin: EdgeInsets.only(
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
            flexibleSpace: const ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(15.0),
              ),
              child: Image(
                image: AssetImage('images/Chicken_Katsu.webp'),
                fit: BoxFit.cover,
              ),
            ),
            expandedHeight: 300.0,
            backgroundColor: Colors.white,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                title: Text('Item #$index'),
              ),
              childCount: 1000,
            ),
          ),
        ],
      ),
    );
  }
}
