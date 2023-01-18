import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_project/Getx/controller.dart';
import 'package:firebase_project/Screens/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBording extends GetView<HomeController> {
  String a =
      'https://thumbs.dreamstime.com/b/chat-message-smartphone-vector-illustration-flat-cartoon-sms-bubbles-mobile-phone-screen-white-background-man-chatting-178873449.jpg';

  String b =
      'https://thumbs.dreamstime.com/b/mobile-phone-chat-notification-message-blue-background-vector-illustration-isolated-colored-smartphone-bubble-speeches-220655878.jpg';

  String c =
      'https://media.istockphoto.com/vectors/chat-messages-smartphone-sms-on-mobile-phone-screen-man-woman-couple-vector-id1262582481?k=20&m=1262582481&s=170667a&w=0&h=CSwd-i239G8fCfCS6zNzV4LIJWN6YHHrehV0crsaq78=';

//  @override
//  void dispose(){
//   homectrl.controller.dispose();
//   super.dispose();
//  }
  @override
  Widget build(BuildContext context) {
    final homectrl = Get.put(HomeController());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: homectrl.pagecontroller,
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.white,
              child: Center(
                child: Image(image: CachedNetworkImageProvider(a)),
              ),
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.white,
              child: Center(
                child: Image(image: CachedNetworkImageProvider(b)),
              ),
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.white,
              child: Center(
                child: Image(image: CachedNetworkImageProvider(c)),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: 40),
        height: 80,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          TextButton(
              onPressed: () => Get.to(loginScreen()), child: Text("SKIP")),
          Center(
              child: SmoothPageIndicator(
            controller: homectrl.pagecontroller,
            count: 3,
            effect: WormEffect(
              spacing: 16,
              dotColor: Colors.black26,
              activeDotColor: Colors.teal.shade700,
            ),
          )),
          TextButton(
              onPressed: () => homectrl.pagecontroller.nextPage(
                  duration: Duration(microseconds: 500),
                  curve: Curves.easeInOut),
              child: Text("NEXT")),
        ]),
      ),
    );
  }
}
