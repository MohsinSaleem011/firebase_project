import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_project/CropImage/cropimage.dart';
import 'package:firebase_project/DataFromFirebase/data.dart';
import 'package:firebase_project/OCR/ocr.dart';
import 'package:firebase_project/Screens/calculator.dart';
import 'package:firebase_project/Screens/email.dart';
import 'package:firebase_project/Screens/loginscreen.dart';
import 'package:firebase_project/Screens/profilescreen.dart';
import 'package:firebase_project/Screens/scrolablesheet.dart';
import 'package:firebase_project/Screens/search.dart';
import 'package:firebase_project/constraints/constraints.dart';
import 'package:firebase_project/constraints/sty6les.dart';
import 'package:firebase_project/contacts/contact_list.dart';
import 'package:firebase_project/images/getImages.dart';
import 'package:firebase_project/realtimedatabase/crud.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../images/uploadimages.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String f =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRf7Xmqgy41LeXF8SwGxvhFt6yY1evRwq-HBA&usqp=CAU';

  bool switched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Switch(
          //   value: switched,
          //   onChanged: switchmethod,
          //   activeColor: Color.fromARGB(255, 84, 110, 131),
          //   activeTrackColor: Color.fromARGB(255, 199, 191, 167),
          //   inactiveThumbColor: Color.fromARGB(255, 214, 105, 105),
          //   inactiveTrackColor: Color.fromARGB(255, 247, 151, 7),
          // ),
        ],
      ),
      appBar: myAppBar('Chat Appp'),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: SafeArea(
          child: ListView(
            children: [
              Container(
                  height: 150,
                  width: 150,
                  child: Image(image: CachedNetworkImageProvider(f))),
              SizedBox(
                height: 30,
              ),
              MyDrawerItems('My Profile', Icons.person, () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return Profile();
                }));
              }),
              MyDrawerItems('Chat Screen', Icons.chat, () {}),
              MyDrawerItems('History', Icons.history, () {}),
              MyDrawerItems('Search Screen', Icons.search, () {
                Get.to(SearchScreen());
              }),

              // MyDrawerItems('Update Profile', Icons.chat, () {
              //   Get.to(CreateProfile());
              // }),
              MyDrawerItems('Update Profile', Icons.person_add, () {
                Get.to(Data());
              }),
              MyDrawerItems('Send Email', Icons.email, () {
                Get.to(EmailSend());
              }),
              MyDrawerItems('Get Contacts', Icons.contacts, () {
                Get.to(Contacts());
              }),
              MyDrawerItems('Images', Icons.image, () {
                Get.to(AddImg());
              }),
              MyDrawerItems('Calculator', Icons.countertops, () {
                Get.to(Calculator());
              }),
              MyDrawerItems('Log Out', Icons.logout, () {
                Get.to(loginScreen());
              }),
              MyDrawerItems('RealTime Datebase', Icons.logout, () {
                Get.to(RealTime());
              }),
              MyDrawerItems('Scrolable Sheet', Icons.settings_ethernet, () {
                Get.to(Scrolable());
              }),
               MyDrawerItems('OCR', Icons.settings_ethernet, () {
                Get.to(OCR());
              }),
              MyDrawerItems('Crop Image', Icons.crop, () {
                Get.to(CropImage());
              }),
            ],
          ),
        ),
      ),
    );
  }

  Padding MyDrawerItems(String mane, IconData icons, VoidCallback tap) {
    return Padding(
      padding: const EdgeInsets.all(13),
      child: Row(
        children: [
          Icon(icons),
          SizedBox(
            width: 20,
          ),
          TextButton(
              onPressed: tap,
              child: Text(
                mane,
                style: DrawerStyles(),
              )),
        ],
      ),
    );
  }

  void switchmethod(bool value) {
    setState(() {
      if (switched == false) {
        Text("Switch Button is ON");
        switched = true;
      } else {
        Text("Switch Button is Off");
        switched = false;
      }
    });
  }
}
