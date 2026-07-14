import 'package:flutter/material.dart';

class Splach extends StatelessWidget {
  const Splach({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.teal,
          child: Container(
            child: Image(
              width: double.infinity,
              image: AssetImage("assets/images/logo1.jpeg"),
            ),
          )
        ),
      ),
    );
  }
}