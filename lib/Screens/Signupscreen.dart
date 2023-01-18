import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/Getx/controller.dart';
import 'package:firebase_project/Screens/loginscreen.dart';
import 'package:firebase_project/constraints/sty6les.dart';
import 'package:firebase_project/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends GetView<HomeController> {
  final globalkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    HomeController homectrl = Get.put(HomeController());
    validatesignup(String name,String email,String password) async {
      if (globalkey.currentState!.validate()) {
        FirebaseAuth auth = FirebaseAuth.instance;
        FirebaseFirestore _firestore= FirebaseFirestore.instance;
        auth
            .createUserWithEmailAndPassword(
                email: email,
                password: password);
                await _firestore.collection("loginuser").doc().set({
                  "name":name,
                  "email":email,
                  "status":"Unavailable"
                })
                
            .whenComplete(
              () => {
                Get.to(

                  () => loginScreen(),
                ),
              },
            );
        SharedPreferences prefe = await SharedPreferences.getInstance();
        prefe.setString("email", homectrl.email.value.text);
        prefe.setString("name", homectrl.nameC.value.text);
      }
    }

    return Scaffold(
      body: ListView(children: [
        SizedBox(
          height: 60,
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            "Sign UP",
            style: Loginstyle(),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Form(
          key: globalkey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(14),
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  validator: (v) {
                    if (v!.isEmpty || v == null) {
                      return "Please enter your name";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.name,
                  controller: homectrl.nameC.value,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                      hintText: "enter Name",
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(27),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14),
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  validator: (v) {
                    if (v!.isEmpty || !v.contains("@") || !v.contains(".com")) {
                      return "email is badly formated";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  controller: homectrl.email.value,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                      hintText: "enter Email",
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(27),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14),
                child: TextFormField(
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "password should not be a empty";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  controller: homectrl.password.value,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                      hintText: "Enter Password",
                      prefixIcon: Icon(Icons.remove_red_eye_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(27),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14),
                child: TextFormField(
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "Number not less than 11 Digits";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  controller: homectrl.number.value,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                      hintText: "Enter your number",
                      prefixIcon: Icon(Icons.remove_red_eye_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(27),
                      )),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        MyButton('Sign Up', Colors.green.withOpacity(0.5), () {
          // FirebaseService();
          validatesignup("${homectrl.nameC}","${homectrl.email}","${homectrl.password}");
        }),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 40,
          ),
          child: Row(
            children: [
              Text(
                "Allready have an account?",
                style: TextStyles(),
              ),
              MaterialButton(
                onPressed: () {
                  Get.to(loginScreen());
                },
                child: Text(
                  "Sign In",
                  style: TextStyle(color: Colors.green.withOpacity(0.9)),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
