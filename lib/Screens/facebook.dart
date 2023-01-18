import 'package:firebase_project/Screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';

class Facebook extends StatefulWidget {
  @override
  State<Facebook> createState() => _FacebookState();
}

class _FacebookState extends State<Facebook> {
  Map userobj = {};
  bool isloggedin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          child: isloggedin == true
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(userobj['name']),
                    Text(userobj['email']),
                    TextButton(
                        onPressed: () {
                          FacebookAuth.instance.logOut().then((value) {
                            setState(() {
                              isloggedin = false;
                              userobj = {};
                              // Get.to(HomePage());
                            });
                          });
                        },
                        child: Text("LogOut")),
                  ],
                )
              : Center(
                  child: ElevatedButton(
                    child: Text("Login with FaceBook"),
                    onPressed: () {
                      FacebookAuth.instance
                          .login(permissions: ["public profile", "email"]).then(
                              (value) {
                        FacebookAuth.instance
                            .getUserData()
                            .then((userData) async {
                          setState(() {
                            isloggedin = true;
                            userobj = userData;
                          });
                        });
                        Get.to(HomePage());
                      });
                    },
                  ),
                )),
    );
  }
}
