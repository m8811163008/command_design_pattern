/// An interface that defines method to be implemented by the
/// specific command concrete classes.
abstract class Command {
  void execute();
  String getTitle();
  void undo();
}
