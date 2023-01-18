import 'package:firebase_project/constraints/sty6les.dart';
import 'package:flutter/material.dart';

class Updated extends StatefulWidget {
  Updated({Key? key, this.name, this.age, this.birthday, this.phone})
      : super(key: key);
  TextEditingController? name;
  TextEditingController? age;
  TextEditingController? birthday;
  TextEditingController? phone;

  @override
  State<Updated> createState() => _UpdatedState();
}

class _UpdatedState extends State<Updated> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.age!.dispose();
    widget.name!.dispose();
    widget.birthday!.dispose();
    widget.phone!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Updated Profile",
          style: DrawerStyles(),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(hintText: "Name"),
              controller: widget.name,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(hintText: "Age"),
              controller: widget.age,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(hintText: "Birthday"),
              controller: widget.birthday,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(hintText: "Phone #"),
              controller: widget.phone,
            ),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
