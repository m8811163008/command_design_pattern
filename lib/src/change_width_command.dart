import 'package:command_design_pattern/model/shape.dart';
import 'package:command_design_pattern/src/command.dart';
import 'package:faker/faker.dart';

class ChangeWidthCommand implements Command {
  Shape shape;
  late double previousWidth;

  ChangeWidthCommand(this.shape) {
    previousWidth = shape.width;
  }

  @override
  void execute() {
    shape.width = random.integer(150, min: 50).toDouble();
  }

  @override
  String getTitle() {
    return 'Change width';
  }

  @override
  void undo() {
    shape.width = previousWidth;
  }
}
