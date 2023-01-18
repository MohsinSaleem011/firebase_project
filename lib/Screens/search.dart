
import 'package:firebase_project/constraints/sty6les.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController search=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Search Screen",style: Loginstyle(),),
      ),
      body: ListView(
children: [
  Padding(
    padding: const EdgeInsets.all(30),
    child: Container(
      height: 70,
      width: 150,
      decoration:BoxDecoration(
        color: Colors.grey.withOpacity(0.5),
        borderRadius: BorderRadius.circular(30)
      ) ,
      child: TextFormField(
        controller: search,
        decoration: InputDecoration(border: InputBorder.none),
      ),
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(40),
    child: ElevatedButton(onPressed: (){}, child: Text("Search",style: TextStyle(fontSize: 20),)),
  )
],
      ),
    );
    
  }
}