import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project/newcrud/show.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class CreateCrud extends StatefulWidget {
  const CreateCrud({Key? key}) : super(key: key);

  @override
  State<CreateCrud> createState() => _CreateCrudState();
}

class _CreateCrudState extends State<CreateCrud> {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

  TextEditingController nameA=TextEditingController();
  TextEditingController emailA=TextEditingController();
  TextEditingController phoneA=TextEditingController();
  TextEditingController aboutA=TextEditingController();
  
void createcrud(String name,String email,String phone, String about)async{
await firestore.collection("newcrud").add({
"name":name,
"email":email,
"phone":phone,
"about":about
});
}
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
      
      children: [
        SizedBox(height: 80,),
        TextFormField(
          controller: nameA,
        ),
        TextFormField(
          controller: emailA,
        ),
        TextFormField(
          controller: phoneA,
        ),
        TextFormField(
          controller: aboutA,
        ),
SizedBox(height: 30,),
ElevatedButton(onPressed: (){
  createcrud(nameA.text, emailA.text, phoneA.text, aboutA.text);
  Get.to(ShowCrud());
}, child: Text("Create"))
      ],
      ),
    );


  }
}