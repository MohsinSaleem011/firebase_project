import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final pagecontroller = PageController();
  Rx<TextEditingController> nameC = TextEditingController().obs;
  Rx<TextEditingController> password = TextEditingController().obs;
  Rx<TextEditingController> email = TextEditingController().obs;
  Rx<TextEditingController> otp = TextEditingController().obs;
  Rx<TextEditingController> number = TextEditingController().obs;
  // Rx<TextEditingController> name= TextEditingController().obs;
  // Rx<TextEditingController> birth= TextEditingController().obs;
  // Rx<TextEditingController> age= TextEditingController().obs;
  // Rx<TextEditingController> numberrr= TextEditingController().obs;

  GlobalKey DlobalKey = GlobalKey<FormState>();
  Rx<bool> isloggedin = false.obs;
  RxMap<String, dynamic> userobj = <String, dynamic>{}.obs;
  void userobject(Map userobj) {
    userobj = userobj;
  }

  void islogin(bool isloggedin) {
    isloggedin = !isloggedin;
  }
}
