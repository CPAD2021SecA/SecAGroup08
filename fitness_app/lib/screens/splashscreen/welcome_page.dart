import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<WelcomePage> createState() => _WelcomePageWidgetState();
}

class _WelcomePageWidgetState extends State<WelcomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.blueAccent,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height * 1,
          ),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF000000), Color(0xFF1A181A), Color(0xFF000000)],
              stops: [0.2, 0.6, 1],
              begin: AlignmentDirectional(0.64, -1),
              end: AlignmentDirectional(-0.64, 1),
            ),
            shape: BoxShape.rectangle,
          ),
          alignment: const AlignmentDirectional(0, 0.050000000000000044),
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(-0.06, -0.08),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.width * 0.6,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEEEEEE),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.asset(
                        'assets/images/fitness.jpg',
                      ).image,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              const Align(
                alignment: AlignmentDirectional(-0.1, -0.67),
                child: Text(
                  'Fitness App',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.blue,
                    fontSize: 40,
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-0.02, 0.64),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFF1C4DA1),
                    onPrimary: Colors.white,
                    shadowColor: Colors.greenAccent,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                    minimumSize: const Size(200, 80), //////// HERE
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
