import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mockup/Screens/Signup/signup_screen.dart';
import 'package:mockup/components/already_have_an_account_acheck.dart';
import 'package:mockup/components/rounded_button.dart';
import 'package:mockup/components/rounded_input_field.dart';

import 'background.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              icon: Icons.email,
              onChanged: (value) {},
              textInputType: TextInputType.emailAddress,
            ),
            RoundedInputField(
              hintText: "Your Mobile",
              icon: Icons.phone_iphone,
              onChanged: (value) {},
              textInputType: TextInputType.phone,
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
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
