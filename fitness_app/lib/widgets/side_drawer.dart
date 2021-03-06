import 'package:fitness_app/core/utils/providerhelper.dart';
import 'package:fitness_app/screens/about/about.dart';
import 'package:fitness_app/screens/home_page/home_page.dart';
import 'package:fitness_app/screens/user-profile/settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'google_sign_in.dart';
class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          const DrawerHeader(
            child: Center(
              child: Text(
                'Fitness App',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 25,fontWeight: FontWeight.bold),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.deepPurple,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () => {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()))
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () => {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SettingsPage()))
            },
          ),

          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            onTap: () => {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => About()))
            },
          ),

          ListTile(
            leading: ElevatedButton(
              onPressed: () {
                final provider =
                Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.logout();

              },
              child: const Text('Logout'),
            ),

          ),
        ],
      ),
    );
  }
}