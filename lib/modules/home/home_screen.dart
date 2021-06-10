import 'package:coffe_app/modules/home/widget/login_and_register.dart';
import 'package:coffe_app/modules/home/widget/login_with_facebook.dart';
import 'package:coffe_app/modules/home/widget/slider_dot.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.asset('assets/images/coffee_time.png'),
            SliderDot(),
            SizedBox(
              height: 20,
            ),
            Text(
              'Get the best coffee\nin town!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: mPrimaryTextColor,
                fontSize: 32,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 60,
            ),
            LoginAndRegister(),
            LoginWithFacebook()
          ],
        ),
      ),
    );
  }
}

