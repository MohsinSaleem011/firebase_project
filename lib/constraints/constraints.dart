import 'package:firebase_project/constraints/sty6les.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Color primaryColor = Colors.purple;
Color secondary = Colors.amber;

AppBar myAppBar(String c) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 10,
    centerTitle: true,
    title: Text(
      c,
      style: Loginstyle(),
    ),
  );
}
