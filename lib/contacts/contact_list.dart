import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project/constraints/sty6les.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

class Contacts extends StatefulWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  List<String>? nameList;
  List<dynamic>? contactList;
  List<Contact>? contacts;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  addContacts(List<dynamic> name, List<dynamic> number) async {
    await firestore
        .collection("contacts")
        .add({"name": name, "number": number}).whenComplete(
            () => print("Added successfully"));
  }

  @override
  void initState() {
    getcontacts();
    super.initState();
  }

  Future<void>? getcontacts() async {
    if (await FlutterContacts.requestPermission()) {
      contacts = await FlutterContacts.getContacts(
        withAccounts: true,
        withGroups: true,
        withPhoto: true,
        withProperties: true,
        withThumbnail: true,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Get Contacts",style: Loginstyle(),),
      ),
      body: Center(
          child: MaterialButton(
            color: Colors.white,
              onPressed: () {
                nameList = contacts!.map<String>((e) => e.displayName).toList();
                contactList = contacts!
                    .map<dynamic>((e) => e.phones.map<dynamic>((e) => e.number))
                    .toList();
                addContacts(nameList!.map((e) => e.toString()).toList(),
                    contactList!.map((e) => e.toString()).toList());
              },
              child: Text("Get",style: Loginstyle(),))),
    );
  }
}
