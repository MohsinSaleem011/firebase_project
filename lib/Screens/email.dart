import 'package:firebase_project/constraints/sty6les.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class EmailSend extends StatefulWidget {
  const EmailSend({Key? key}) : super(key: key);
  @override
  State<EmailSend> createState() => _EmailSendState();
}

class _EmailSendState extends State<EmailSend> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailC = TextEditingController();
  TextEditingController subjectC = TextEditingController();
  TextEditingController bodyC = TextEditingController();
  void send() async {
    Email email = Email(
        body: bodyC.text,
        subject: subjectC.text,
        recipients: [emailC.text],
        isHTML: false);
    await FlutterEmailSender.send(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Contact Form",
          style: Loginstyle(),
        ),
      ),
      body: Scrollbar(
        thumbVisibility: true,
        thickness: 5,
        scrollbarOrientation: ScrollbarOrientation.bottom,
        trackVisibility: true,
        showTrackOnHover: true,
        hoverThickness: 5,
        radius: Radius.circular(5),
        child: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: emailC,
                      decoration: InputDecoration(
                          hintText: "Email", icon: Icon(Icons.email)),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: subjectC,
                      decoration: InputDecoration(
                          hintText: "Subject", icon: Icon(Icons.subject)),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: bodyC,
                      decoration: InputDecoration(
                          hintText: "Body", icon: Icon(Icons.boy_rounded)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: MaterialButton(
                color: Colors.white,
                onPressed: () {
                  send();
                },
                child: Text(
                  "Send Email",
                  style: Loginstyle(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
