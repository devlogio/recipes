class Recipe {
  String image;
  String title;
  String description;
  String difficulty;
  String time;
  String serving;
  List<String> ingredients;
  List<String> directions;

  Recipe(
    this.image,
    this.title,
    this.description,
    this.difficulty,
    this.time,
    this.serving,
    this.ingredients,
    this.directions,
  );
}
