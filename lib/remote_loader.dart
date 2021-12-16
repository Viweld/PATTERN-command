import 'package:flutter/material.dart';
import 'package:remote_controller/business_logic/commands/ceiling_fan_on_command.dart';
import 'package:remote_controller/business_logic/commands/garage_dor_up_command.dart';
import 'package:remote_controller/business_logic/commands/light_off_command.dart';
import 'package:remote_controller/business_logic/commands/stereo_off_command.dart';
import 'package:remote_controller/business_logic/commands/stereo_on_command.dart';
import 'package:remote_controller/business_logic/remote_control.dart';
import 'package:remote_controller/devices/garage_door.dart';
import 'package:remote_controller/devices/light.dart';

import 'business_logic/commands/ceiling_fan_off_command.dart';
import 'business_logic/commands/garage_dor_down_command.dart';
import 'business_logic/commands/light_on_command.dart';
import 'devices/ceiling_fan.dart';
import 'devices/stereo.dart';

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
    CeilingFanOnCommand ceilingFanOn = CeilingFanOnCommand(fan: ceilingFan);
    CeilingFanOffCommand ceilingFanOff = CeilingFanOffCommand(fan: ceilingFan);
    GarageDoorUpCommand garageDoorUp = GarageDoorUpCommand(door: garageDoor);
    GarageDoorDownCommand garageDoorDown =
        GarageDoorDownCommand(door: garageDoor);
    StereoOnCommand stereoOnWithCD = StereoOnCommand(stereo: stereo);
    StereoOffCommand stereoOff = StereoOffCommand(stereo: stereo);

    _remote = RemoteController();
    _remote.setCommand(0, livingRoomLightOn, livingRoomLightOff);
    _remote.setCommand(1, kitchenLightOn, kitchenLightOff);
    _remote.setCommand(2, ceilingFanOn, ceilingFanOff);
    _remote.setCommand(3, stereoOnWithCD, stereoOff);
  }

  RemoteController get remoteControler => _remote;

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
