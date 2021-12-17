import 'package:remote_controller/domain/command.dart';
import 'package:remote_controller/domain/entities/garage_door.dart';

class GarageDoorUpCommand implements Command {
  static late bool _prevState;
  final GarageDoor _door;

  GarageDoorUpCommand({
    required GarageDoor door,
  }) : _door = door {
    _prevState = _door.isOpened;
  }

  @override
  void execute() {
    _prevState = _door.isOpened;
    _door.up();
  }

  @override
  void undo() {
    switch (_prevState) {
      case true:
        _door.up();
        break;
      case false:
        _door.down();
        break;
    }
  }
}
