 import 'package:firebase_project/constraints/sty6les.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

Padding MyButton(String name,Color color,VoidCallback ontap) {
    return Padding(
        padding: const EdgeInsets.only(right: 20,left: 20),
        child: Container(
          height: 50,
          width: double.infinity,
          child: MaterialButton(
            color: color,
            shape: StadiumBorder(),
            onPressed: ontap,
            child: Text(
             name,
              style: buttonStyle(),
            ),
          ),
        ),
      );
  }