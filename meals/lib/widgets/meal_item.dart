import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_details.dart';
import 'package:meals/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem(
      {super.key,
      required this.meal,
      required this.onSelectMeal,
      required this.onToggleFavourite});
  final Meal meal;
  final void Function(BuildContext context, Meal meal) onSelectMeal;
  final void Function(Meal meal) onToggleFavourite;

  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1, meal.complexity.name.length);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1, meal.complexity.name.length);
  }

  void _selectMeal(BuildContext context, Meal meal) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) => MealDetailsScreen(
                  meal: meal,
                  onToggleFavourite: onToggleFavourite,
                )));
  }

  @override
  Widget build(context) {
    return Card(
      margin: const EdgeInsets.all(14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.hardEdge,
      elevation: 3,
      child: InkWell(
        onTap: () {
          _selectMeal(context, meal);
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              left: 0,
              bottom: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding: const EdgeInsets.symmetric(),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        MealItemTrait(icon: Icons.work, label: complexityText),
                        const SizedBox(
                          width: 5,
                        ),
                        MealItemTrait(
                            icon: Icons.schedule,
                            label: '${meal.duration} min'),
                        const SizedBox(
                          width: 5,
                        ),
                        MealItemTrait(
                            icon: Icons.attach_money, label: affordabilityText),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
