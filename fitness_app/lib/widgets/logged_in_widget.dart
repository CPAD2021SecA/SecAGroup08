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
    // db.collection('profile').doc(user!.email).set({
    //   'height':'-',
    //   'age':'-',
    //   'weight':'-'
    // });
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    var spacecrafts = ["Cobra", "Leg Raises", "Crunches", "Lunges", "Skipping", "Mountain climbing", "Plank", "reverse leg raises","bridge"];
    var images = ["1.jpg","cat2.gif", "2.jpg","cat7.gif", "3.jpg", "cat3.gif", "5.jpg",  "cat5.gif", "7.jpg"];
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
            title: const Text('Fitness app'),
            actions: [ RaisedButton(
              color: Colors.deepPurple,
              child:  CircleAvatar(
                maxRadius: 25,
                backgroundImage: NetworkImage(user!.photoURL != null?  user!.photoURL! :
                "https://t3.ftcdn.net/jpg/03/46/83/96/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg"),
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

