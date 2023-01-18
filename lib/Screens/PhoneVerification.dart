import 'package:firebase_project/Screens/otpsocdescreen.dart';
import 'package:firebase_project/constraints/sty6les.dart';
import 'package:flutter/material.dart';

class PhoneVerification extends StatefulWidget {
  const PhoneVerification({Key? key}) : super(key: key);

  @override
  State<PhoneVerification> createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  final globalkey = GlobalKey<FormState>();

  final phonecontroller = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    phonecontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Text(
              "Phone Verification",
              style: Loginstyle(),
            ),
          ),
          SizedBox(
            height: 70,
          ),
          Form(
            key: globalkey,
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: TextFormField(
                validator: (v) {
                  if (v!.isEmpty) {
                    return "Number should not be a empty";
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                controller: phonecontroller,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                    hintText: "Enter your number",
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(27),
                    )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(40),
            child: MaterialButton(
              color: Colors.green,
              onPressed: () {
                if (phonecontroller != null) {
                  final phonenumber = ("+92" + phonecontroller.text);
                  AuthProvider().LogInWithPhone(context, phonenumber);
                }
              },
              child: Text(
                "Login",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
