import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/core/utils/providerhelper.dart';
import 'package:fitness_app/screens/login-signup/login.dart';
import 'package:fitness_app/widgets/google_sign_in.dart';
import 'package:fitness_app/widgets/logged_in_widget.dart';
import 'package:fitness_app/widgets/sign_up_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static const String id = 'HomePageScreen';
  @override
  Widget build(BuildContext context) => Scaffold(
    body: ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          final provider = Provider.of<GoogleSignInProvider>(context);

          if (provider.isSigningIn) {
            return buildLoading();
          } else if (snapshot.hasData) {
            return LoggedInWidget();
          } else {
            return LoginScreen();
          }
        },
      ),
    ),
  );

  Widget buildLoading() => Stack(
    fit: StackFit.expand,
    children: [
      Center(child: CircularProgressIndicator()),
    ],
  );
}