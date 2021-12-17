import 'package:flutter/material.dart';

import 'google_signup_button_widget.dart';

class SignUpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Stack(
    fit: StackFit.expand,
    children: [
      buildSignUp(),
    ],
  );

  Widget buildSignUp() => Column(
    children: [
      const Spacer(),
      Align(
        alignment: Alignment.centerLeft,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          width: 175,
          child: const Text(
            'Welcome to the fitNESS app',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      const Spacer(),
      GoogleSignupButtonWidget(),
      const SizedBox(height: 12),
      const Text(
        'Login to continue',
        style: TextStyle(fontSize: 16),
      ),
      const Spacer(),
    ],
  );
}