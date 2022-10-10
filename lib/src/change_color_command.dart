import 'package:command_design_pattern/model/shape.dart';
import 'package:command_design_pattern/src/command.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

/// A specific implementation of the command which changes the
/// colour of the [Shape] object.
class ChangeColorCommand implements Command {
  Shape shape;
  late Color previousColor;

  ChangeColorCommand(this.shape) {
    previousColor = shape.color;
  }

  @override
  void execute() {
    shape.color = Color.fromRGBO(
        random.integer(255), random.integer(255), random.integer(255), 1.0);
  }

  @override
  String getTitle() {
    return 'Change color';
  }

  @override
  void undo() {
    shape.color = previousColor;
  }
}
