  import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Padding profilecontainer(String text) {
    return Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Container(
            height: 50,
            width: 80,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
              child: Text(text,style: TextStyle(fontSize: 20),),
            ),
            decoration: BoxDecoration(
            color: Colors.white,
boxShadow: [
BoxShadow(
  blurRadius: 10,

  color: Colors.grey,
)
]              ),
          ),
        );
  }