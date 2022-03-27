import 'package:cred/core/Extensions.dart';
import 'package:flutter/material.dart';
import 'package:cred/components/rounded_button.dart';
import 'package:cred/core/AppConstants.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
final emailController = TextEditingController();
final passwordController = TextEditingController();
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  String password;
  bool isLoading = false;
  @override
  Future<http.Response> createAlbum(String username, String password) {
    return http.post(
      Uri.parse('$BaseURL/users/login/email'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': email,
        'password' : password,
      }),
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor.fromHex(DarkBackground),
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('assets/images/zepp.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                controller: emailController,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email=value;
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your email',
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                style: TextStyle(color: Colors.white),
                controller: passwordController,
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password=value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your password.'
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                title: 'Login',
                onPressed: () async{
                  http.Response myBody=await createAlbum(email , password);
                 // emailController.clear();
                 //  passwordController.clear();
                  Get.toNamed(RouteDashboard);
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