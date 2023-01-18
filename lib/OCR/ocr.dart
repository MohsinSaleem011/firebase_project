import 'dart:developer';
import 'package:firebase_project/OCR/imagemodel.dart';
import 'package:firebase_project/constraints/sty6les.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';

import 'image_picker.dart';

class OCR extends StatefulWidget {
  const OCR({super.key});

  @override
  State<OCR> createState() => _OCRState();
}

class _OCRState extends State<OCR> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "OCR",
          style: Loginstyle(),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Center(
              child: FloatingActionButton.extended(
                label: Text('Scan Photo'),
                onPressed: () {
                  ImagePickerModel(context, oncameratap: () {
                    log("Camera");
                    pcikImage(source: ImageSource.camera).then((value) => {
                          if (value != '')
                            {
                              // ImageCropping(value, context),
                            }
                        });
                  }, ongallerytap: () {
                    log("Gallery");
                    pcikImage(source: ImageSource.gallery).then((value) => {
                          if (value != '')
                            {
                              // ImageCropping(value, context),
                            }
                        });
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}