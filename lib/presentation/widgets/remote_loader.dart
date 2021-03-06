import 'package:flutter/material.dart';
import 'package:remote_controller/domain/entities/ceiling_fan.dart';
import 'package:remote_controller/domain/entities/garage_door.dart';
import 'package:remote_controller/domain/entities/light.dart';
import 'package:remote_controller/domain/entities/stereo.dart';
import 'package:remote_controller/domain/remote_controller.dart';
import 'package:remote_controller/domain/use_cases/ceiling_fan_high_command.dart';
import 'package:remote_controller/domain/use_cases/ceiling_fan_off_command.dart';
import 'package:remote_controller/domain/use_cases/garage_door_down_command.dart';
import 'package:remote_controller/domain/use_cases/garage_door_up_command.dart';
import 'package:remote_controller/domain/use_cases/light_off_command.dart';
import 'package:remote_controller/domain/use_cases/light_on_command.dart';
import 'package:remote_controller/domain/use_cases/stereo_off_command.dart';
import 'package:remote_controller/domain/use_cases/stereo_on_with_cd_command.dart';


class RemoteLoader extends InheritedWidget {

 static late RemoteController _remote;

  void initRemote() {
    Light livingRoomLight = Light(location: 'Спальня');
    Light kitchenLight = Light(location: 'Кухня');
    CeilingFan ceilingFan = CeilingFan();
    GarageDoor garageDoor = GarageDoor();
    Stereo stereo = Stereo();
    LightOnCommand livingRoomLightOn = LightOnCommand(light: livingRoomLight);
    LightOffCommand livingRoomLightOff =
        LightOffCommand(light: livingRoomLight);
    LightOnCommand kitchenLightOn = LightOnCommand(light: kitchenLight);
    LightOffCommand kitchenLightOff = LightOffCommand(light: kitchenLight);
    CeilingFanHighCommand ceilingFanOn = CeilingFanHighCommand(fan: ceilingFan);
    CeilingFanOffCommand ceilingFanOff = CeilingFanOffCommand(fan: ceilingFan);
    GarageDoorUpCommand garageDoorUp = GarageDoorUpCommand(door: garageDoor);
    GarageDoorDownCommand garageDoorDown =
        GarageDoorDownCommand(door: garageDoor);
    StereoOnWithCDCommand stereoOnWithCD = StereoOnWithCDCommand(stereo: stereo);
    StereoOffCommand stereoOff = StereoOffCommand(stereo: stereo);

    _remote = RemoteController();
    _remote.setCommand(0, livingRoomLightOn, livingRoomLightOff);
    _remote.setCommand(1, kitchenLightOn, kitchenLightOff);
    _remote.setCommand(2, ceilingFanOn, ceilingFanOff);
    _remote.setCommand(3, stereoOnWithCD, stereoOff);
  }

  RemoteController get remoteController => _remote;

  const RemoteLoader({
    required Widget child,
    Key? key,
  }) : super(
          key: key,
          child: child,
        );

  static RemoteLoader? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<RemoteLoader>();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}
