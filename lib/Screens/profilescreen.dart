import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/Getx/controller.dart';
import 'package:firebase_project/constraints/sty6les.dart';
import 'package:firebase_project/widgets/profilecontainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? _image;
  String? _imagepath;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LoadImage();
  }

  @override
  Widget build(BuildContext context) {
    HomeController home = Get.put(HomeController());

    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          _imagepath != null
              ? CircleAvatar(
                  child: Image.file(
                    File(
                      _imagepath.toString(),
                    ),
                    fit: BoxFit.cover,
                  ),
                  radius: 80,
                )
              : CircleAvatar(
                  radius: 80,
                  child: _image != null
                      ? Image.file(_image!)
                      : Image.network(
                          "https://www.mockofun.com/wp-content/uploads/2019/12/circle-profile-pic.jpg",
                          fit: BoxFit.cover,
                        ),
                ),
          InkWell(
              onTap: () {
                pickedimage();
                saveImage(_image!.path);
              },
              child: Icon(
                Icons.camera_alt_outlined,
                size: 30,
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Name",
              style: Loginstyle(),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          profilecontainer(home.nameC.value.text),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Email",
              style: Loginstyle(),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          profilecontainer(FirebaseAuth.instance.currentUser!.email.toString()),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Phone #",
              style: Loginstyle(),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          profilecontainer(home.number.value.text.toString()),
        ],
      ),
    );
  }

  Future<void> pickedimage() async {
    final ImagePicker _picker = ImagePicker();

    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = File(image!.path);
      // saveImage();
    });
  }

  void saveImage(path) async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    pre.setString("imagepath", path);
  }

  void LoadImage() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      _imagepath = pref.getString("imagepath");
    });
  }
}
