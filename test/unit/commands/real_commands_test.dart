import 'package:remote_controller/domain/entities/ceiling_fan.dart';
import 'package:remote_controller/domain/entities/garage_door.dart';
import 'package:remote_controller/domain/entities/light.dart';
import 'package:remote_controller/domain/entities/stereo.dart';
import 'package:remote_controller/domain/use_cases/ceiling_fan_high_command.dart';
import 'package:remote_controller/domain/use_cases/ceiling_fan_medium_command.dart';
import 'package:remote_controller/domain/use_cases/ceiling_fan_off_command.dart';
import 'package:remote_controller/domain/use_cases/garage_door_down_command.dart';
import 'package:remote_controller/domain/use_cases/garage_door_up_command.dart';
import 'package:remote_controller/domain/use_cases/light_off_command.dart';
import 'package:remote_controller/domain/use_cases/light_on_command.dart';
import 'package:remote_controller/domain/use_cases/stereo_off_command.dart';
import 'package:remote_controller/domain/use_cases/stereo_on_with_cd_command.dart';
import 'package:test/test.dart';

void main() {

  test('Команды для управления освещением в Спальне', () {
    Light livingRoomLight = Light(location: 'Спальня');
    LightOnCommand livingRoomLightOn = LightOnCommand(light: livingRoomLight);
    livingRoomLightOn.execute();
    livingRoomLightOn.undo();
    LightOffCommand livingRoomLightOff =
        LightOffCommand(light: livingRoomLight);
    livingRoomLightOff.execute();
    livingRoomLightOn.undo();
  });

  test('Команды для управления освещением в Кухне', () {
    Light kitchenLight = Light(location: 'Кухня');
    LightOnCommand kitchenLightOn = LightOnCommand(light: kitchenLight);
    kitchenLightOn.execute();
    kitchenLightOn.undo();
    LightOffCommand kitchenLightOff = LightOffCommand(light: kitchenLight);
    kitchenLightOff.execute();
    kitchenLightOff.undo();
  });

  test('Команды для управления вентилятором', () {
    CeilingFan ceilingFan = CeilingFan();
    CeilingFanMediumCommand ceilingFanMedium = CeilingFanMediumCommand(fan: ceilingFan);
    ceilingFanMedium.execute();
    ceilingFanMedium.undo();
    CeilingFanHighCommand ceilingFanHigh = CeilingFanHighCommand(fan: ceilingFan);
    ceilingFanHigh.execute();
    ceilingFanHigh.undo();
    CeilingFanOffCommand ceilingFanOff = CeilingFanOffCommand(fan: ceilingFan);
    ceilingFanOff.execute();
    ceilingFanOff.undo();
  });

  test('Команды для управления воротами', () {
    GarageDoor garageDoor = GarageDoor();
    GarageDoorUpCommand garageDoorUp = GarageDoorUpCommand(door: garageDoor);
    garageDoorUp.execute();
    garageDoorUp.undo();
    GarageDoorDownCommand garageDoorDown =
    GarageDoorDownCommand(door: garageDoor);
    garageDoorDown.execute();
    garageDoorDown.undo();
  });

  test('Команды для управления стереосистемой', () {
    Stereo stereo = Stereo();
    StereoOnWithCDCommand stereoOnWithCD = StereoOnWithCDCommand(stereo: stereo);
    stereoOnWithCD.execute();
    stereoOnWithCD.undo();
    StereoOffCommand stereoOff = StereoOffCommand(stereo: stereo);
    stereoOff.execute();
    stereoOff.undo();
  });
}
