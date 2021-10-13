import 'package:flutter/material.dart';
import 'package:recipes_flutter_apprentice/recipe.dart';
import 'package:recipes_flutter_apprentice/recipe_detal.dart';

void main() {
  runApp(RecipeApp());
}

class RecipeApp extends StatelessWidget {
  RecipeApp({Key? key}) : super(key: key);
  final ThemeData theme = ThemeData();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Calculator',
      theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(
        primary: Colors.grey,
        secondary: Colors.black,
      )),
      home: const MyHomePage(title: 'Recipe Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: ListView.builder(
            itemCount: Recipe.samples.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RecipeDetail(
                        recipe: Recipe.samples[index],
                      ),
                    ),
                  );
                },
                child: buildRecipeCard(Recipe.samples[index]),
              );
            }),
      ),
    );
  }

  Widget buildRecipeCard(Recipe recipe) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image(
              image: AssetImage(recipe.imageUrl),
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              recipe.label,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                fontFamily: 'Palatino',
              ),
            )
          ],
        ),
      ),
    );
  }
}
