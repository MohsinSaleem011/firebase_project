import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project/Screens/profile.dart';
import 'package:firebase_project/constraints/sty6les.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({Key? key}) : super(key: key);

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}
class _CreateProfileState extends State<CreateProfile> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController birthcontroller = TextEditingController();
  TextEditingController agecontroller = TextEditingController();
  TextEditingController mobilecontroller = TextEditingController();
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    namecontroller.dispose();
    birthcontroller.dispose();
    agecontroller.dispose();  }
  String? update;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Create Profile",style: DrawerStyles(),),
      ),
      body: ListView(
        children: [
          SizedBox(height: 50,),
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
              decoration: InputDecoration(hintText: "Age"),
              controller: agecontroller,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(hintText: "Birthday"),
              controller: birthcontroller,
            ),
          ),
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(hintText: "Phone #"),
              controller: mobilecontroller,
            ),
            
          ),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.all(40),
            child: MaterialButton(
              color: Colors.green,
                onPressed: () {
                  update = namecontroller.text +
                      agecontroller.text +
                      birthcontroller.text+mobilecontroller.text;

                  createUser(name: namecontroller.text, age: agecontroller.text, birhtday: birthcontroller.text,mobile: mobilecontroller.text);
              Get.to(Updated(
                name: namecontroller,
                age: agecontroller,
                birthday: birthcontroller,
                phone: mobilecontroller,
              ));
                },
                child: Text("Create")),
          ),
        ],
      ),
    );
  }

  void createUser({String? name, String? age, String? birhtday,String? mobile}) async {
    //Reference to documents
    final docUser = FirebaseFirestore.instance.collection('user').doc('my_id');

    final json = {
      'name': name,
      'age': age,
      'birthday': birhtday,
      'mobile':mobile,
    };
    //create document and write data to FirebaseFirestore
    await docUser.set(json );
  }
}
