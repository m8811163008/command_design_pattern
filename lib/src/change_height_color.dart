import 'package:command_design_pattern/model/shape.dart';
import 'package:command_design_pattern/src/command.dart';
import 'package:faker/faker.dart';

class ChangeHeightCommand implements Command {
  Shape shape;
  late double previousHeight;

  ChangeHeightCommand(this.shape) {
    previousHeight = shape.height;
  }

  @override
  void execute() {
    shape.height = random.integer(150, min: 50).toDouble();
  }

  @override
  String getTitle() {
    return 'Change height';
  }

  @override
  void undo() {
    shape.height = previousHeight;
  }
}
