import 'package:flutter/material.dart';

class IndicatorsView extends StatelessWidget {
  const IndicatorsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
          ),
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
          ),
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
          ),
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
          ),
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
          ),
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
          ),
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
          ),
        ],
      ),
    );
  }
}
