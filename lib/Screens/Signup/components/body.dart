import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mockup/Screens/Login/login_screen.dart';
import 'package:mockup/Screens/Verify/verify.dart';
import 'package:mockup/components/already_have_an_account_acheck.dart';
import 'package:mockup/components/rounded_button.dart';
import 'package:mockup/components/rounded_input_field.dart';

import 'background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.35,
            ),
            RoundedInputField(
              hintText: "Your Name",
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "Your Email",
              icon: Icons.email,
              onChanged: (value) {},
              textInputType: TextInputType.emailAddress,
            ),
            RoundedInputField(
              hintText: "Mobile Number",
              icon: Icons.phone_iphone,
              onChanged: (value) {},
              textInputType: TextInputType.phone,
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return VerifyPage();
                    },
                  ),
                );
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
