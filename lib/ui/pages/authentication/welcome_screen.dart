import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cred/components/rounded_button.dart';
import 'package:cred/core/AppConstants.dart';
import 'package:cred/core/Extensions.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 2,
      ),
    );
    animation = ColorTween(begin: HexColor.fromHex(White), end: HexColor.fromHex(DarkBackground))
        .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                child: Image.asset('assets/images/zepp.png'),
                height: 100.0,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: DefaultTextStyle(
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
                child: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    TypewriterAnimatedText('Zepp'),
                    TypewriterAnimatedText('YOUR'),
                    TypewriterAnimatedText('PERSONALIZED'),
                    TypewriterAnimatedText('COUPON'),
                    TypewriterAnimatedText('MANAGER'),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              title: 'Login',
              onPressed: () {
                Get.toNamed(Login);
              },
              colour: Colors.black87,
            ),
            RoundedButton(
              title: 'Register',
              onPressed: () {
                Get.toNamed(Registration);
              },
              colour: Colors.black87,
            ),
          ],
        ),
      ),
    );
  }
}