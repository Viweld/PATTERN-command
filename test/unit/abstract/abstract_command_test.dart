import 'package:mockito/mockito.dart';
import 'package:remote_controller/business_logic/command.dart';
import 'package:test/test.dart';

class MockCommand extends Mock implements Command{}


void main(){
  final command = MockCommand();

  test('Тестирование абстрактного класса', (){
    command.execute();
  });
}