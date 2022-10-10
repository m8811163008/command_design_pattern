import 'package:flutter/material.dart';

/// A simple class to store information about the shape.
class Shape {
  late Color color;
  late double height;
  late double width;

  Shape.initial() {
    color = Colors.black;
    height = 150.0;
    width = 150.0;
  }
}
