import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project/DataFromFirebase/showData.dart';
import 'package:firebase_project/constraints/sty6les.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Data extends StatefulWidget {
  const Data({Key? key}) : super(key: key);

  @override
  State<Data> createState() => _DataState();
}

class _DataState extends State<Data> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phoncontroller = TextEditingController();
  TextEditingController abtcontroller = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    namecontroller.dispose();
    emailcontroller.dispose();
    phoncontroller.dispose();
    abtcontroller.dispose();
    namecontroller .clear();
    emailcontroller.clear();
    phoncontroller.clear();
    abtcontroller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Add Data",
          style: DrawerStyles(),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(hintText: "Name"),
              controller: namecontroller,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(hintText: "Email"),
              controller: emailcontroller,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(hintText: "Mobile #"),
              controller: phoncontroller,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(hintText: "About"),
              controller: abtcontroller,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(40),
            child: MaterialButton(
                color: Colors.green,
                onPressed: () {
                  namecontroller.text +
                      emailcontroller.text +
                      phoncontroller.text +
                      abtcontroller.text;
                  addUser(namecontroller.text, emailcontroller.text,
                      phoncontroller.text, abtcontroller.text);
                  Get.to(ShowData());
                },
                child: Text("Create")),
          ),
        ],
      ),
    );
  }

  void addUser(String name, String email, String phone, String about) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    await firestore
        .collection("flutter add")
        .add({"name": name, "email": email, "phone": phone, "about": about});
  }
}
