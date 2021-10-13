import 'package:flutter/material.dart';
import 'package:recipes_flutter_apprentice/recipe.dart';

class RecipeDetail extends StatefulWidget {
  const RecipeDetail({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  final Recipe recipe;
  @override
  _RecipeDetailState createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  int _sliderVal = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.label),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image(
                image: AssetImage(
                  widget.recipe.imageUrl,
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              widget.recipe.label,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: widget.recipe.ingredients.length,
                  itemBuilder: (context, index) {
                    final ingredient = widget.recipe.ingredients[index];
                    return Text(
                        '${ingredient.quantity * _sliderVal} ${ingredient.measure} ${ingredient.name}');
                  }),
            ),
            Slider(
              min: 1,
              max: 10,
              divisions: 10,
              value: _sliderVal.toDouble(),
              onChanged: (newValue) {
                setState(() {
                  _sliderVal = newValue.round();
                });
              },
              label: '${_sliderVal * widget.recipe.servings} servings',
              activeColor: Colors.green,
              inactiveColor: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
