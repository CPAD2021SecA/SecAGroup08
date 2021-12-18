import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/core/utils/orientation_util.dart';
import 'package:fitness_app/screens/user-profile/edit_info.dart';
import 'package:fitness_app/widgets/side_drawer.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class ProfileApp extends StatefulWidget {
  final User user;
  var height = 'loading', weight='loading', age='loading';
  ProfileApp({Key? key, required this.user}) : super(key: key);

  @override
  _ProfileAppState createState() => _ProfileAppState();
}

class _ProfileAppState extends State<ProfileApp> {
  final db = FirebaseFirestore.instance;

  Future<void> asyncFunc() async => db.collection('profile').doc(widget.user.email).get()
      .then((DocumentSnapshot documentSnapshot) {
        setState(() {
          widget.height = documentSnapshot['height'];
          widget.weight =  documentSnapshot['weight'];
          widget.age = documentSnapshot['age'];
        });
  });

  @override
  void initState() {
    asyncFunc();
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if(state == AppLifecycleState.resumed){
      asyncFunc();
    }
  }


  //
  // // Get value of field date from document dashboard/totalVisitors
  // firestoreDate = documentSnapshot.data()['date'];
  //
  // // Get value of field weekOfYear from document dashboard/totalVisitors
  // firestoreWeek = documentSnapshot.data()['weekOfYear'];
  //
  // }
  // );



  Duration get loginTime => const Duration(milliseconds: 2250);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Fitness app'),
      ),
      drawer: SideDrawer(),
      body: Column(
        children: [
          Container(
              decoration:  BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.deepPurple, Colors.pinkAccent]
                  )
              ),
              child: SizedBox(
                width: double.infinity,
                // height: OrientationUtil.getHeight(context, 0.25, 0.25),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: OrientationUtil.getHeight(context, 0.05, 0.05),
                      ),
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          widget.user!.photoURL != null?  widget.user!.photoURL! :
                          "https://t3.ftcdn.net/jpg/03/46/83/96/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg"

                        ),
                        radius: 50.0,
                      ),

                      Text(

                        widget.user!.displayName != null ? widget.user!.displayName! : "Praveen Kumar",
                        style: const TextStyle(
                          fontSize: 22.0,
                          color: Colors.white,
                        ),
                      ),
                       SizedBox(
                        height: OrientationUtil.getHeight(context, 0.05, 0.05),
                      ),
                      Card(
                        margin: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
                        clipBehavior: Clip.antiAlias,
                        color: Colors.white,
                        elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 22.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(

                                  children: [
                                    const Text(
                                      "Height",
                                      style: TextStyle(
                                        color: Colors.deepPurple,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: OrientationUtil.getHeight(context, 0.05, 0.05),
                                    ),
                                    Text(
                                      widget.height,
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.deepPurple,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(

                                  children:  [
                                    Text(
                                      "Weight",
                                      style: TextStyle(
                                        color: Colors.deepPurple,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: OrientationUtil.getHeight(context, 0.05, 0.05),
                                    ),
                                    Text(
                                      widget.weight+"KG",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.deepPurple,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(

                                  children:  [
                                    Text(
                                      "Age",
                                      style: TextStyle(
                                        color: Colors.deepPurple,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: OrientationUtil.getHeight(context, 0.05, 0.05),
                                    ),
                                    Text(
                                      widget.age,
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.deepPurple,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
          ),
           SizedBox(
            height: OrientationUtil.getHeight(context, 0.02, 0.02),
          ),
          SizedBox(
            width: 300.00,

            child: ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>  EditProfile(user: widget.user)));
                },
                child: Ink(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [Colors.deepPurple,Colors.deepPurple]
                    ),
                    //borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Container(

                    constraints:  BoxConstraints(maxWidth: 300.0, minHeight: OrientationUtil.getHeight(context, 0.05, 0.05)),
                    alignment: Alignment.center,
                    child: const Text("Edit Profile",
                      style: TextStyle(color: Colors.white, fontSize: 26.0, fontWeight:FontWeight.w300),
                    ),
                  ),
                )
            ),
          ),
            SizedBox(
            height: OrientationUtil.getHeight(context, 0.2, 0.2),
            width: 280.0,
            child: SfCartesianChart(                  // Initialize category axis
            primaryXAxis: CategoryAxis(),
            series: <LineSeries<SalesData, String>>[
            LineSeries<SalesData, String>(
            // Bind data source
            dataSource: <SalesData>[
            SalesData('Jan', 35),
            SalesData('Feb', 28),
            SalesData('Mar', 34),
            SalesData('Apr', 32),
            SalesData('May', 40)
            ],
            xValueMapper: (SalesData sales, _) => sales.year,
            yValueMapper: (SalesData sales, _) => sales.sales
            )
            ]),
            ),
        ],
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}


