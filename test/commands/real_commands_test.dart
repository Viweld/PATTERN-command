import 'package:remote_controller/business_logic/commands/ceiling_fan_off_command.dart';
import 'package:remote_controller/business_logic/commands/ceiling_fan_on_command.dart';
import 'package:remote_controller/business_logic/commands/garage_dor_down_command.dart';
import 'package:remote_controller/business_logic/commands/garage_dor_up_command.dart';
import 'package:remote_controller/business_logic/commands/light_off_command.dart';
import 'package:remote_controller/business_logic/commands/light_on_command.dart';
import 'package:remote_controller/business_logic/commands/stereo_off_command.dart';
import 'package:remote_controller/business_logic/commands/stereo_on_command.dart';
import 'package:remote_controller/devices/ceiling_fan.dart';
import 'package:remote_controller/devices/garage_door.dart';
import 'package:remote_controller/devices/light.dart';
import 'package:remote_controller/devices/stereo.dart';
import 'package:test/test.dart';

void main() {
  test('Команды для управления освещением в Спальне', () {
    Light livingRoomLight = Light(location: 'Спальня');
    LightOnCommand livingRoomLightOn = LightOnCommand(light: livingRoomLight);
    LightOffCommand livingRoomLightOff =
        LightOffCommand(light: livingRoomLight);
  });
  test('Команды для управления освещением в Кухне', () {
    Light kitchenLight = Light(location: 'Кухня');
    LightOnCommand kitchenLightOn = LightOnCommand(light: kitchenLight);
    LightOffCommand kitchenLightOff = LightOffCommand(light: kitchenLight);
  });
  test('Команды для управления вентилятором', () {
    CeilingFan ceilingFan = CeilingFan();
    CeilingFanOnCommand ceilingFanOn = CeilingFanOnCommand(fan: ceilingFan);
    CeilingFanOffCommand ceilingFanOff = CeilingFanOffCommand(fan: ceilingFan);

  });
  test('Команды для управления воротами', () {
    GarageDoor garageDoor = GarageDoor();
    GarageDoorUpCommand garageDoorUp = GarageDoorUpCommand(door: garageDoor);
    GarageDoorDownCommand garageDoorDown =
    GarageDoorDownCommand(door: garageDoor);
  });
  test('Команды для управления стереосистемой', () {
    Stereo stereo = Stereo();
    StereoOnCommand stereoOnWithCD = StereoOnCommand(stereo: stereo);
    StereoOffCommand stereoOff = StereoOffCommand(stereo: stereo);
  });
}
