class RecipesData {
  late List<Recipes> recipes;

  RecipesData({required this.recipes});

  factory RecipesData.fromJson(Map m1) {
    return RecipesData(
        recipes:
            (m1['recipes'] as List).map((e) => Recipes.fromJson(e)).toList());
  }
}

class Recipes {
  late int id,
      userId,
      prepTimeMinutes,
      cookTimeMinutes,
      servings,
      caloriesPerServing,
      reviewCount;
  late String name, difficulty, cuisine, image;
  late List ingredients, instructions, tags, mealType;

  Recipes({
    required this.id,
    required this.userId,
    required this.prepTimeMinutes,
    required this.cookTimeMinutes,
    required this.servings,
    required this.caloriesPerServing,
    required this.reviewCount,
    required this.name,
    required this.difficulty,
    required this.cuisine,
    required this.image,
    required this.ingredients,
    required this.instructions,
    required this.tags,
  });

  factory Recipes.fromJson(Map m1) {
    return Recipes(
        id: m1['id'],
        userId: m1['userId'],
        prepTimeMinutes: m1['prepTimeMinutes'],
        cookTimeMinutes: m1['cookTimeMinutes'],
        servings: m1['servings'],
        caloriesPerServing: m1['caloriesPerServing'],
        reviewCount: m1['reviewCount'],
        name: m1['name'],
        difficulty: m1['difficulty'],
        cuisine: m1['cuisine'],
        image: m1['image'],
        ingredients: m1['ingredients'],
        instructions: m1['instructions'],
        tags: m1['tags']);
  }
}
