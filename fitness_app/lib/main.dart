import 'package:fitness_app/screens/about/about.dart';
import 'package:fitness_app/screens/home_page/home_page.dart';
import 'package:fitness_app/screens/splashscreen/welcome_page.dart';
import 'package:fitness_app/widgets/google_sign_in.dart';
import 'package:fitness_app/widgets/logged_in_widget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';



Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<GoogleSignInProvider>(create: (_) => GoogleSignInProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        routes: {
          WelcomePage.id: (context) => WelcomePage(),
          HomePage.id: (context) => HomePage(),
          About.id: (context) => About(),
          LoggedInWidget.id: (context) => LoggedInWidget(),
        },
        initialRoute: WelcomePage.id,
        home: const WelcomePage(),
      )
    );
  }
}
