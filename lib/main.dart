import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:remote_controller/data_injector.dart';
import 'package:remote_controller/my_system.dart';

Logger log = Logger(
  printer: PrettyPrinter(),
);

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataInjector(
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MySystem(),
      ),
    );
  }
}
