import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

TextFormField Mytextformfield(TextEditingController controller,String v ,Icon icon,TextInputType type) {
    return TextFormField(

      keyboardType: type,
            controller:controller,
            textAlign: TextAlign.start,
            decoration: InputDecoration(
              hintText: v,
              prefixIcon: icon,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(27),
              )
            ),
          );
  }