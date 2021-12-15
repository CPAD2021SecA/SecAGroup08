import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: ContactUs(
          logo: const AssetImage('assets/images/fitness2.png'),
          email: 'fitnessapp@sap.com',
          companyName: 'Fitness App',
          phoneNumber: '+91123456789',
          dividerThickness: 2,
          website: 'https://github.com/CPAD2021SecA/SecAGroup08',
          tagLine: 'Get a jump on your day.', taglineColor: Colors.white, companyColor: Colors.white, cardColor: const Color(0xFF019E8C), textColor: Colors.white,
        ),
      ),
    );
  }
}