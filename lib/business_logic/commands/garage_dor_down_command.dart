import 'package:remote_controller/business_logic/command.dart';
import 'package:remote_controller/devices/garage_door.dart';

class GarageDoorDownCommand implements Command {
  final GarageDoor _door;

  GarageDoorDownCommand({
    required  GarageDoor door,
  }) : _door = door;

  @override
  void execute() {
    _door.down();
  }
}
