import 'package:flutter/material.dart';

void ImagePickerModel(BuildContext context,{VoidCallback? oncameratap, VoidCallback? ongallerytap }) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(20),
          height: 220,
          child: Column(
            children: [
              InkWell(
                onTap: oncameratap,
                child: Card(
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "Camera",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: ongallerytap,
                child: Card(
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "Gallery",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      });
}
