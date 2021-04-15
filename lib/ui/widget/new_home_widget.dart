import 'package:flutter/material.dart';

class NewHomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 250,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Colors.red],
        ),
      ),
      child: Center(
        child: Text('New HomeWidget'),
      ),
    );
  }
}
