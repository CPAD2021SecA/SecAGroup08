import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/screens/exercise-screen/timer.dart';
import 'package:fitness_app/screens/user-profile/profile.dart';
import 'package:fitness_app/widgets/side_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class LoggedInWidget extends StatefulWidget {
  static const String id = 'LoggedInScreen';
  const LoggedInWidget({Key? key}) : super(key: key);
  @override
  _LoggedInWidgetState createState() => _LoggedInWidgetState();
}

class _LoggedInWidgetState extends State<LoggedInWidget> {

  final db = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    db.collection('profile').doc(user!.email).set({
      'height':'-',
      'age':'-',
      'weight':'-'
    });
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    var spacecrafts = ["PushUp", "Side Squats", "Squats", "PullUp"];
    var images = ["workout1.png","workout2.png","workout3.png", "workout4.png"];
    var myGridView = GridView.builder(
      itemCount: spacecrafts.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          child: Card(
            elevation: 5.0,
            child: Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 10.0, bottom: 10.0,left: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/images/exercises/"+images[index],
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.14,
                  ),
                  //mediaquery.of(context).size.width
                  Text(spacecrafts[index],style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300
                  ),),
                ],
              ),
            ),
          ),
          onTap: () {

            Navigator.push(context, MaterialPageRoute(builder: (context) => ExerciseScreen(passedImage: 'assets/images/exercises/'+images[index])));
          },
        );
      },
    );

    return user!=null? SafeArea(
      child: Scaffold(
          drawer: SideDrawer(),
          appBar: AppBar(
            centerTitle: true,
            title: const Text('the fitNESS app'),
            actions: [ RaisedButton(
              color: Colors.deepOrange,
              child:  CircleAvatar(
                maxRadius: 25,
                backgroundImage: NetworkImage(user!.photoURL!),
              ),
              onPressed:(){
                //go to edit profile
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileApp(user: user!)));
              },
            ),
            ],
          ),
          body: myGridView
      ),
    ):const Text("User is null") ;

  }

}

