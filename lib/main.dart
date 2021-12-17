import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:remote_controller/presentation/widgets/remote_loader.dart';
import 'package:remote_controller/presentation/my_system_screen.dart';

Logger log = Logger(
  printer: PrettyPrinter(),
);

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RemoteLoader(
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MySystemScreen(),
      ),
    );
  }
}
