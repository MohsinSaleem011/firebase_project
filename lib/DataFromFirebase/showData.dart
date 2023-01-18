import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project/constraints/sty6les.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowData extends StatefulWidget {
  const ShowData({Key? key}) : super(key: key);

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  TextEditingController nameC = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController about = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameC.dispose();
    email.dispose();
    phone.dispose();
    about.dispose();
  }

  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  void deletedata(String id) async {
    await _firestore.collection("flutter add").doc(id).delete();
  }

  void updateData(
      {String? id,
      String? name,
      String? email,
      String? phone,
      String? about}) async {
    {
      Map<String, Object> Mycrud = {};
      if (name == "") {
      } else {
        Mycrud["name"] = name!;
      }
      if (email == "") {
      } else {
        Mycrud["email"] = email!;
      }
      if (phone == "") {
      } else {
        Mycrud["phone"] = phone!;
      }
      if (email == "") {
      } else {
        Mycrud["about"] = about!;
      }
      await _firestore.collection("flutter add").doc(id).update(Mycrud);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Retrieve Data",
          style: DrawerStyles(),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection("flutter add").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            var dataa = snapshot.data!.docs;
            return ListView.builder(
                itemCount: dataa.length,
                itemBuilder: (context, index) {
                  final data = snapshot.data!.docs[index];
                  return Dismissible(
                    direction: DismissDirection.startToEnd,
                    onDismissed: (_) {
                      deletedata(data.id);
                    },
                    key: UniqueKey(),
                    background: Icon(Icons.delete, size: 30),
                    child: Card(
                      child: ExpansionTile(
                        title: Text(
                          data["name"],
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        leading: IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (_) {
                                    return AlertDialog(
                                      title: SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  "Update Data",
                                                  style: TextStyle(
                                                      color: Colors.green,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                IconButton(
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                  icon: Icon(
                                                    Icons.cancel,
                                                    size: 25,
                                                    color: Colors.green,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 2,
                                            ),
                                            TextFormField(
                                              decoration: InputDecoration(
                                                  hintText: "Name"),
                                              controller: nameC,
                                            ),
                                            TextFormField(
                                              decoration: InputDecoration(
                                                  hintText: "Email"),
                                              controller: email,
                                            ),
                                            TextFormField(
                                              decoration: InputDecoration(
                                                  hintText: "Phone"),
                                              controller: phone,
                                            ),
                                            TextFormField(
                                              decoration: InputDecoration(
                                                  hintText: "About"),
                                              controller: about,
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            TextButton(
                                                onPressed: () {
                                                  updateData(
                                                      id: data.id,
                                                      name: nameC.text,
                                                      email: email.text,
                                                      phone: phone.text,
                                                      about: about.text);
                                                  Get.back();
                                                },
                                                child: Text(
                                                  "Update",
                                                  style: DrawerStyles(),
                                                ))
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            },
                            icon: Icon(
                              Icons.edit,
                              size: 20,
                            )),
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Email: ",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                data["email"],
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Phone Number: ",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                data["phone"],
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "About: ",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                data["about"],
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
