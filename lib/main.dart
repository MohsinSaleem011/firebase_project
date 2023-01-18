import 'package:firebase_project/Screens/homepage.dart';
import 'package:firebase_project/Screens/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences preference = await SharedPreferences.getInstance();
  var email = preference.getString("email");
  var name = preference.getString("name");

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // initialRoute: '/',
      //     getPages: [
      //         GetPage(
      // name: '/login',
      // page: () => loginScreen(),
      // transition: Transition.zoom,),
      //               ],
      //  routes: {
      //     '/login':(context)=>loginScreen(),
      //     '/onbording':(context)=>OnBording(),
      //     // '/login':(context)=>SplashScreen(),
      //  },
      home: email == null && name == null ? SplashScreen() : HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
    ),
  );
}
