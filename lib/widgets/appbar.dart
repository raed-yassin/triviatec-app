import 'package:flutter/material.dart';
import 'package:triviatec_app/utils/colors.dart';

AppBar header() => AppBar(
  backgroundColor: primaryColor,
  foregroundColor: whiteColor,
  title: Text("TriviaTec App", style: TextStyle(fontWeight: FontWeight.bold)),
  centerTitle: true,
);
