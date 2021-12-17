import 'package:remote_controller/business_logic/commands/light_off_command.dart';
import 'package:remote_controller/business_logic/commands/light_on_command.dart';
import 'package:remote_controller/business_logic/commands/no_command.dart';
import 'package:remote_controller/business_logic/remote_controller.dart';
import 'package:remote_controller/devices/light.dart';
import 'package:test/test.dart';

void main() {
  test('Создание пульта и проверка пустых кнопок', () {
    final remoteController = RemoteController();
    for (int i = 0; i < 7; i++) {
      remoteController.onButtonWasPushed(i);
      remoteController.offButtonWasPushed(i);
    }
    remoteController.undoButtonWasPushed();
  });

  group('Назначение команд и испытание нажатий', () {
    Light kitchenLight = Light(location: 'Кухня');
    LightOnCommand kitchenLightOn = LightOnCommand(light: kitchenLight);
    LightOffCommand kitchenLightOff = LightOffCommand(light: kitchenLight);

    test('Установка команд на кнопки и испытание функционирования', () {
      final remoteController = RemoteController();

      for (int i = 0; i < 7; i++) {
        /// проверка назначения пары кнопок
        expect(remoteController.onCommands[i].runtimeType,
            NoCommand().runtimeType);
        expect(remoteController.offCommands[i].runtimeType,
            NoCommand().runtimeType);
        remoteController.setCommand(i, kitchenLightOn, kitchenLightOff);
        expect(remoteController.onCommands[i], kitchenLightOn);
        expect(remoteController.offCommands[i], kitchenLightOff);

        /// проверка достижения командами устройств назначения
        remoteController.onButtonWasPushed(i);
        expect(kitchenLight.isIlluminated, true);
        remoteController.offButtonWasPushed(i);
        expect(kitchenLight.isIlluminated, false);
      }
    });

    test('Тестирование кнопки Undo', () {
      final remoteController = RemoteController();

      /// проверка пустой кнопки Undo
      expect(remoteController.undoCommand.runtimeType, NoCommand().runtimeType);

      /// проверка способности пульта запоминать последнюю выполненную команду
      remoteController.setCommand(1, kitchenLightOn, kitchenLightOff);
      remoteController.onButtonWasPushed(1);
      expect(kitchenLight.isIlluminated, true);
      expect(remoteController.undoCommand, kitchenLightOn);

      /// проверка нажатия кнопки Undo (отслеживание состояния устройства назначения)
      remoteController.undoButtonWasPushed();
      expect(kitchenLight.isIlluminated, false);
    });
  });
}
