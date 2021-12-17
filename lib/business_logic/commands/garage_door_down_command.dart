import 'package:remote_controller/business_logic/command.dart';
import 'package:remote_controller/devices/garage_door.dart';

class GarageDoorDownCommand implements Command {
  static late bool _prevState;
  final GarageDoor _door;

  GarageDoorDownCommand({
    required  GarageDoor door,
  }) : _door = door{
    _prevState = _door.isOpened;
  }

  @override
  void execute() {
    _prevState = _door.isOpened;
    _door.down();
  }

  @override
  void undo() {
    switch(_prevState){
      case true: _door.up();
      break;
      case false: _door.down();
      break;
    }
  }
}
