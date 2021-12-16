import 'dart:io';

import 'package:mockito/mockito.dart';
import 'package:remote_controller/business_logic/command.dart';
import 'package:remote_controller/business_logic/commands/light_off_command.dart';
import 'package:remote_controller/business_logic/commands/light_on_command.dart';
import 'package:remote_controller/business_logic/remote_controller.dart';
import 'package:remote_controller/devices/light.dart';
import 'package:test/test.dart';

class MockCommand extends Mock implements Command {}

void main() {

  test('Создание пульта и проверка пустых кнопок', () {
    final remoteController = RemoteController();
    for (int i = 0; i < 7; i++) {
      remoteController.onButtonWasPushed(i);
      remoteController.offButtonWasPushed(i);
    }
  });

  test('Установка команд на кнопки и испытание функционирования', () {
    final remoteController = RemoteController();
    Light kitchenLight = Light(location: 'Кухня');
    LightOnCommand kitchenLightOn = LightOnCommand(light: kitchenLight);
    LightOffCommand kitchenLightOff = LightOffCommand(light: kitchenLight);

    for (int i = 0; i < 7; i++) {
      remoteController.setCommand(i, kitchenLightOn, kitchenLightOff);
      remoteController.onButtonWasPushed(i);
      expect(kitchenLight.isIlluminated, true);
      remoteController.offButtonWasPushed(i);
      expect(kitchenLight.isIlluminated, false);
    }
  });

}
