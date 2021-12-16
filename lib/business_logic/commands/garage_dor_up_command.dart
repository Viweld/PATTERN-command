import 'package:remote_controller/business_logic/command.dart';
import 'package:remote_controller/devices/garage_door.dart';

class GarageDoorUpCommand implements Command {
  final GarageDoor _door;

  GarageDoorUpCommand({
    required  GarageDoor door,
  }) : _door = door;

  @override
  void execute() {
    _door.up();
  }
}
