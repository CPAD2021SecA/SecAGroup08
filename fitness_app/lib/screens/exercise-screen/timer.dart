import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
      home: ExerciseScreen(passedImage: "2")),
  );
}

class ExerciseScreen extends StatefulWidget{
  final String passedImage;
  const ExerciseScreen({Key? key, required this.passedImage}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ExerciseScreenState();
  }

}

class _ExerciseScreenState extends State<ExerciseScreen>{

  static const timeLimitInSeconds = 60;
  int second = timeLimitInSeconds;
  Timer? timer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation){
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Container(
                width: orientation == Orientation.landscape ? MediaQuery.of(context).size.width * 0.5 : MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: Image.asset(
                      'assets/images/exercises/'+widget.passedImage+'.jpg',
                    ).image,
                  ),
                  shape: BoxShape.rectangle,
                ),
              ),
              SizedBox(height: orientation == Orientation.landscape ? 5 : 30),
              Column(
                children: [
                  getClock(orientation),
                  SizedBox(height: orientation == Orientation.landscape ? 5 : 30),
                  createButton()
                ],
              ),
            ],
          );
      })
    ));
  }



  createTime(Orientation orientation) {
    return Center(
      child: Text(
        '$second',
        style: TextStyle(
            color: Colors.black,
            fontSize: orientation == Orientation.landscape ? 50 : 80
        ),
      ),
    );
  }

  void startTimer({bool reset = true}) {
    if(reset){
      setState(() {
        second = 60;
      });
    }
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if(second > 0){
        setState(() {
          second--;
        });
      }else{
        stopTimer(reset: true);
      }
    });
  }
  
  createButton() {

    final isRunning = timer == null ? false : timer!.isActive;
    final isCompleted = second == timeLimitInSeconds || second == 0;
    return isRunning || !isCompleted ? Row(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        ElevatedButton(
            onPressed: () {
              if(isRunning) {
                stopTimer(reset: false);
              } else {
                startTimer(reset: false);
              }
            },
            child: Text(isRunning? "Pause" : "Resume")),
        const SizedBox(width: 30,),
        ElevatedButton(
            onPressed: () => stopTimer(reset: true),
            child: const Text("Cancel")),
      ],
    ):
    ElevatedButton(
        onPressed: () => startTimer(reset:false),
        child: const Text("Start"));
  }

  stopTimer({bool reset = true}) {
    setState(() {
      timer?.cancel();
    });
    if(reset){
      setState(() {
        second = 60;
      });
    }
  }

  getClock(Orientation orientation) {
    return SizedBox(
      width: orientation == Orientation.landscape ? 120 : 200,
      height: orientation == Orientation.landscape ? 120 : 200,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CircularProgressIndicator(
            value: 1 - second/ timeLimitInSeconds,
            valueColor: const AlwaysStoppedAnimation(Colors.red),
            strokeWidth: 10,
            backgroundColor: Colors.yellow,
          ),
          createTime(orientation)
        ],
      ),
    );
  }
}