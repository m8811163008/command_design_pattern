import 'package:command_design_pattern/model/command_history.dart';
import 'package:command_design_pattern/model/shape.dart';
import 'package:command_design_pattern/src/change_color_command.dart';
import 'package:command_design_pattern/src/change_height_color.dart';
import 'package:command_design_pattern/src/change_width_command.dart';
import 'package:command_design_pattern/src/command.dart';
import 'package:command_design_pattern/widgets/command_history_column.dart';
import 'package:command_design_pattern/widgets/platform_button.dart';
import 'package:command_design_pattern/widgets/shape_container.dart';
import 'package:flutter/material.dart';

/// The client code isn't coupled to concrete command classes
/// because it works with commands via the command interface.
class CommandExample extends StatefulWidget {
  const CommandExample({Key? key}) : super(key: key);

  @override
  State<CommandExample> createState() => _CommandExampleState();
}

class _CommandExampleState extends State<CommandExample> {
  final CommandHistory _commandHistory = CommandHistory();
  final Shape _shape = Shape.initial();

  void _changeColor() {
    final command = ChangeColorCommand(_shape);
    _executeCommand(command);
  }

  void _changeHeight() {
    final command = ChangeHeightCommand(_shape);
    _executeCommand(command);
  }

  void _changeWidth() {
    final command = ChangeWidthCommand(_shape);
    _executeCommand(command);
  }

  void _executeCommand(Command command) {
    setState(() {
      command.execute();
      _commandHistory.add(command);
    });
  }

  void _undo() {
    setState(() {
      _commandHistory.undo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const ScrollBehavior(),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: <Widget>[
            ShapeContainer(shape: _shape),
            const SizedBox(
              height: 12.0,
            ),
            PlatformButton(
              materialColor: Colors.black,
              materialTextColor: Colors.white,
              onPressed: _changeColor,
              text: 'Change color',
            ),
            PlatformButton(
              materialColor: Colors.black,
              materialTextColor: Colors.white,
              onPressed: _changeHeight,
              text: 'Change height',
            ),
            PlatformButton(
              materialColor: Colors.black,
              materialTextColor: Colors.white,
              onPressed: _changeWidth,
              text: 'Change width',
            ),
            const Divider(),
            PlatformButton(
              materialColor: Colors.black,
              materialTextColor: Colors.white,
              onPressed: _commandHistory.isEmpty ? null : _undo,
              text: 'Undo',
            ),
            const SizedBox(height: 12.0),
            Row(
              children: <Widget>[
                CommandHistoryColumn(
                    commandList: _commandHistory.commandHistoryList)
              ],
            )
          ],
        ),
      ),
    );
  }
}
