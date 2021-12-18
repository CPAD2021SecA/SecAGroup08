import 'package:fitness_app/core/utils/email_auth.dart';
import 'package:fitness_app/screens/home_page/home_page.dart';
import 'package:fitness_app/widgets/google_sign_in.dart';
import 'package:fitness_app/widgets/logged_in_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  Duration get loginTime => const Duration(milliseconds: 2250);

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'Login',
      // logo: const AssetImage('assets/images/fitness2.png'),
      onLogin: (param) {
        var authHandler = new Auth();
        authHandler.handleSignInEmail(param.name, param.password)
            .then((User user) {
              print(user.email! +"ok");
          Navigator.push(context, new MaterialPageRoute(builder: (context) => new LoggedInWidget()));
        }).catchError((e) => print(e));
      },
      onSignup: (param) {
        var authHandler = new Auth();
        authHandler.handleSignUp(param.name, param.password)
            .then((User user) {

          final db = FirebaseFirestore.instance;

          db.collection('profile').doc(user!.email).update(
              {
                'height': '-',
                'age': '-',
                'weight': '-'
              }
          );


          Navigator.push(context, new MaterialPageRoute(builder: (context) => new LoggedInWidget()));
        }).catchError((e) => print(e));
      },
      theme: LoginTheme(
        primaryColor: Colors.deepPurple,
        accentColor: Colors.white70,
      ),

      loginProviders: <LoginProvider>[
        LoginProvider(
          icon: FontAwesomeIcons.google,
          label: 'Google',
          callback: () async {
            final provider =
            Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.login();


          },
        ),
        LoginProvider(
          icon: FontAwesomeIcons.facebookF,
          label: 'Facebook',
          callback: () async {
            debugPrint('start facebook sign in');
            await Future.delayed(loginTime);
            debugPrint('stop facebook sign in');
            return null;
          },
        ),
      ],
      onSubmitAnimationCompleted: () {
      }, onRecoverPassword: (param) {} ,
    );
  }
}