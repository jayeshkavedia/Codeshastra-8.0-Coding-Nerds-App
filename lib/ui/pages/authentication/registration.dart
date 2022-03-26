import 'package:cred/core/Extensions.dart';
import 'package:flutter/material.dart';
import 'package:cred/components/rounded_button.dart';
import 'package:cred/core/AppConstants.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:get/get.dart';

final emailController = TextEditingController();
final passwordController = TextEditingController();
final fnameController = TextEditingController();
final lnameController = TextEditingController();
final contactController = TextEditingController();
class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String email;
  String password;
  String fName;
  String lName;
  String contact;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor.fromHex(DarkBackground),
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('assets/images/zepp.png'),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              TextField(
                style: TextStyle(color: Colors.white),
                controller: emailController,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email=value;
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your email',
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              TextField(
                style: TextStyle(color: Colors.white),
                controller: fnameController,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  fName=value;
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter First Name',
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              TextField(
                style: TextStyle(color: Colors.white),
                controller: lnameController,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  lName=value;
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter Last Name',
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              TextField(
                style: TextStyle(color: Colors.white),
                controller: contactController,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  contact=value;
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter Contact No',
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              TextField(
                style: TextStyle(color: Colors.white),
                controller: passwordController,
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value) {
                  password=value;
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your password',
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                title: 'Proceed',
                onPressed: ()  {
                  emailController.clear();
                  passwordController.clear();
                  lnameController.clear();
                  fnameController.clear();
                  contactController.clear();
                  Get.toNamed(CreditCardDetails);
                  setState(() {

                  });
                },
                colour: Colors.black87,
              ),
            ],
          ),
        ),
      ),
    );
  }
}