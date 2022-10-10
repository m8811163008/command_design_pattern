import 'package:command_design_pattern/model/shape.dart';
import 'package:flutter/material.dart';

class ShapeContainer extends StatelessWidget {
  const ShapeContainer({required this.shape, Key? key}) : super(key: key);

  final Shape shape;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160.0,
      child: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          height: shape.height,
          width: shape.width,
          decoration: BoxDecoration(
              color: shape.color, borderRadius: BorderRadius.circular(10.0)),
          child: const Icon(
            Icons.star,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
