import 'package:e_commerce_app/core/functions/check_internet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class MyTest extends StatefulWidget {
  const MyTest({super.key});

  @override
  State<MyTest> createState() => _MyTestState();
}

class _MyTestState extends State<MyTest> {
  checkInternetData() async {
    // var res =
    await checkInternet();
    //print("Check internet data $res");
  }

  @override
  void initState() {
    checkInternetData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(children: [
          OtpTextField(
            fieldWidth: 50,
            borderRadius: BorderRadius.circular(20),
            numberOfFields: 5,
            borderColor: const Color(0xFF512DA8),
            //set to true to show as box or false to show as dash
            showFieldAsBox: true,
            //runs when a code is typed in
            onCodeChanged: (String code) {
              //handle validation or checks here
            },
            //runs when every textfield is filled
            onSubmit: (String verificationCode) {}, // end onSubmit
          ),
        ]),
      ),
    );
  }
}
