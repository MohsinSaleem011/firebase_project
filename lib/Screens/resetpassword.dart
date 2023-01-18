import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/Getx/controller.dart';
import 'package:firebase_project/Screens/loginscreen.dart';
import 'package:firebase_project/constraints/sty6les.dart';
import 'package:firebase_project/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetScreen extends GetView<HomeController> {
  final Globalkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    HomeController homectrls = Get.put(HomeController());
    void validatelogin() async {
      if (Globalkey.currentState!.validate()) {
        FirebaseAuth auth = FirebaseAuth.instance;
        await auth.sendPasswordResetEmail(email: homectrls.email.value.text);
      }
      FirebaseAuth auth = FirebaseAuth.instance;
      var u = auth.currentUser?.uid;
      if (u != null) {
        Get.to(() => loginScreen());
        print(u);
      }
    }

    return Scaffold(
      body: ListView(children: [
        SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            "Reset Password",
            style: Loginstyle(),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Form(
          key: Globalkey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(14),
                child: TextFormField(
                  validator: (v) {
                    if (v!.isEmpty || !v.contains("@") || !v.contains(".com")) {
                      return "email is badly formated";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  controller: homectrls.email.value,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                      hintText: "Enter Email",
                      prefixIcon: Icon(Icons.email),
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
        MyButton('Reset password', Colors.green.withOpacity(0.5), () {
          validatelogin();
        }),
      ]),
    );
  }
}
