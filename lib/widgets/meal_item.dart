// This file is the blue print of styling the list of meals displayed when a single category is selected

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_meta_data.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.selectedMeal});

  final Meal meal;
  final void Function(Meal meal) selectedMeal;


  String get complexityText{
    return meal.complexity.name[0].toUpperCase() + meal.complexity.name.substring(1);
  }

  String get affordabilityText{
    return meal.affordability.name[0].toUpperCase() + meal.affordability.name.substring(1);
  }


  @override
  Widget build(context) {
    return Card(
      margin: const EdgeInsets.all(8),
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      // clipBehavior: Clip.hardEdge,
      // elevation: 2,
      child: InkWell(
        onTap: (){
          selectedMeal(meal);
        },
        child: Stack(
          children: [
            Hero(
              tag: meal.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                // fit: BoxFit.cover
              ),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                  color: Colors.black54,
                  child: Column(
                    children: [
                      Text(
                        meal.title,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MealMetaData(
                              icon: Icons.schedule_rounded,
                              label: '${meal.duration} mins'),
                          const SizedBox(width: 12,), 
                          MealMetaData(icon: Icons.work, label: complexityText),
                          const SizedBox(width: 12,), 
                          MealMetaData(icon: Icons.wallet, label: affordabilityText)
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
