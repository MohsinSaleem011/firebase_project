import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ShowCrud extends StatefulWidget {
  const ShowCrud({Key? key}) : super(key: key);

  @override
  State<ShowCrud> createState() => _ShowCrudState();
}

class _ShowCrudState extends State<ShowCrud> {

  TextEditingController nameA=TextEditingController();
  TextEditingController emailA=TextEditingController();
  TextEditingController phoneA=TextEditingController();
  TextEditingController aboutA=TextEditingController();
  FirebaseFirestore firestores = FirebaseFirestore.instance;
void deletecrud(String id)async{
  firestores.collection("newcrud").doc(id).delete();
}
void updateCrud(String id,String name,String email, String phone,String about)async{
  firestores.collection("newcrud").doc(id).update({
"name":name,
"email":email,
"phone":phone,
"about":about
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: firestores.collection("newcrud").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final dataaa = snapshot.data!.docs[index];
                  return Center(child: Dismissible(
                    background:Icon(Icons.delete),
                    direction: DismissDirection.endToStart,
                    child: Text("${dataaa["name"]}"),
                    onDismissed: (_){
                     deletecrud(dataaa.id);
                    }, key: UniqueKey(),
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
