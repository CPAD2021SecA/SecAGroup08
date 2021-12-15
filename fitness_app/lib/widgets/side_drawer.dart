import 'package:fitness_app/screens/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'google_sign_in.dart';
class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Text(
                'the fitNESS app',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 25,fontWeight: FontWeight.bold),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.deepOrange,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () => {
              Navigator.pushNamed(context, HomePage.id)
            },
          ),
          ListTile(
            leading: Icon(Icons.stacked_bar_chart),
            title: Text('View Stats'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.contact_support),
            title: Text('Contact Us'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About'),
            onTap: () => {Navigator.of(context).pop()},
          ),

          ListTile(
            leading: ElevatedButton(
              onPressed: () {
                final provider =
                Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.logout();
              },
              child: Text('Logout'),
            ),

          ),
        ],
      ),
    );
  }
}