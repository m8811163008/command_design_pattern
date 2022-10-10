import 'dart:collection';

import 'package:command_design_pattern/src/command.dart';

/// A simple class that stores a list of already executed commands.
class CommandHistory {
  // A stack of command names stored in the command history.
  final ListQueue<Command> _commandList = ListQueue<Command>();

  bool get isEmpty => _commandList.isEmpty;

  List<String> get commandHistoryList =>
      _commandList.map((command) => command.getTitle()).toList();
  void add(Command command) {
    _commandList.add(command);
  }

  /// The last command could be undone using the `undo()` method.
  void undo() {
    if (!isEmpty) {
      final command = _commandList.removeLast();
      command.undo();
    }
  }
}
