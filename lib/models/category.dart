// This file is the blueprint for a single category in the Categories Screen

import 'package:flutter/material.dart';

class Category {
  const Category(
      {required this.id,
      required this.title,
      this.color = Colors
          .pinkAccent}); //here incase if no color is provided we have set the default color. Hence this parameter is not a required parameter
  final String id;
  final String title;
  final Color color;
}
