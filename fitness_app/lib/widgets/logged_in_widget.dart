import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/widgets/side_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoggedInWidget extends StatelessWidget {
  static const String id = 'LoggedInScreen';
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return SafeArea(
      child: Scaffold(
        drawer: SideDrawer(),
        appBar: AppBar(
          centerTitle: true,
          title: const Text('the fitNESS app'),
          actions: [ RaisedButton(
            color: Colors.deepOrange,
            child: const CircleAvatar(
              maxRadius: 25,
              // backgroundImage: NetworkImage(user!.photoURL),
            ),
            onPressed:(){
              //go to edit profile
            },
          ),


          ],
        ),
        body: Container(
          alignment: Alignment.center,
          color: Colors.blueGrey.shade900,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  'Welcome '  + '!',
                  style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 20),
                ),
              ),


              SizedBox(height: 80),


            ],
          ),
        ),
      ),
    );
  }
}
