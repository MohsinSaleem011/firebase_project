import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/Getx/controller.dart';
import 'package:firebase_project/Screens/PhoneVerification.dart';
import 'package:firebase_project/Screens/Signupscreen.dart';
import 'package:firebase_project/Screens/homepage.dart';
import 'package:firebase_project/Screens/resetpassword.dart';
import 'package:firebase_project/constraints/sty6les.dart';
import 'package:firebase_project/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class loginScreen extends GetView<HomeController> {
  final Globalkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    HomeController homectrl = Get.put(HomeController());
    void validatelogin() async {
      if (Globalkey.currentState!.validate()) {
        FirebaseAuth auth = FirebaseAuth.instance;
        await auth.signInWithEmailAndPassword(
            email: homectrl.email.value.text,
            password: homectrl.password.value.text);
      }
      FirebaseAuth auth = FirebaseAuth.instance;

      var u = auth.currentUser?.uid;
      if (u != null) {
        Get.to(() => HomePage());
        print(u);
      }
    }

    Future<OAuthCredential> signInWithGoogle() async {
      FirebaseAuth.instance.signOut();
      final GoogleSignInAccount? googleUser = await GoogleSignIn()
          .signIn()
          .whenComplete(() => Get.to(() => HomePage()));

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      return GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
    }

    return Scaffold(
      body: ListView(children: [
        SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            "Log In",
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
                  controller: homectrl.email.value,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                      hintText: "Enter Email",
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
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(27),
                      )),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                  onTap: () {
                    Get.to(ResetScreen());
                  },
                  child: Text(
                    "Reset Password",
                    style: TextStyle(color: Colors.red),
                  )),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        MyButton('Log In', Colors.green.withOpacity(0.5), () {
          validatelogin();
        }),
        SizedBox(
          height: 20,
        ),
        MyButton('Log In with Google', Colors.green.withOpacity(0.5), () {
          signInWithGoogle();
        }),
        SizedBox(
          height: 20,
        ),
        // MyButton('Log In with OTP', Colors.green.withOpacity(0.5), () {
        //   Get.to(OtpScreen());
        // }),
        SizedBox(
          height: 10,
        ),
        MyButton('Log In with OTP', Colors.green.withOpacity(0.5), () {
          Get.to(PhoneVerification());
        }),
        Padding(
          padding: const EdgeInsets.only(left: 60, top: 20),
          child: Row(
            children: [
              Text(
                "Don't have an account? ",
                style: TextStyles(),
              ),
              MaterialButton(
                onPressed: () {
                  Get.to(SignUpScreen());
                },
                child: Text(
                  "Sign Up",
                  style: TextStyle(color: Colors.green.withOpacity(0.9)),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
