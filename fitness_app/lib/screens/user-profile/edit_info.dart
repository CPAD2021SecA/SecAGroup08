import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/widgets/side_drawer.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final db = FirebaseFirestore.instance;

class EditProfile extends StatelessWidget {

  final User user;
  const EditProfile({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Edit Personal Info';

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Fitness app'),
      ),
      drawer: SideDrawer(),
      body:  MyCustomForm( user: user),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  final User user;
  const MyCustomForm({Key? key, required this.user}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState(user);
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  late String height, weight, age;
  User? user;
  MyCustomFormState(User user){
    this.user = user;
  }
  @override
  Widget build(BuildContext context) {

    // Build a Form widget using the _formKey created above.
    TextEditingController _controllerHeight = TextEditingController();
    TextEditingController _controllerWeight = TextEditingController();
    TextEditingController _controllerAge = TextEditingController();
    return SafeArea(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0)
            ),
            TextFormField(
              onChanged: (value){
                height = value;
              },
              controller: _controllerHeight,
              cursorRadius: const Radius.circular(5.0),
              decoration:  InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(
                      color: Colors.deepPurple,
                    )),
                labelText: 'Height',
              ),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0)
            ),
            TextFormField(
              onChanged: (value){
                weight = value;
              },
              controller: _controllerWeight,
            cursorRadius: const Radius.circular(5.0),
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(
                      color: Colors.deepPurple,
                    )),
                labelText: 'Weight',
              ),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0)
            ),
            TextFormField(
              onChanged: (value){
                age = value;
              },
              controller: _controllerAge,
              cursorRadius: const Radius.circular(5.0),
              decoration:  InputDecoration(
                border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: const BorderSide(
                color: Colors.deepPurple,
                )),
                labelText: 'Age',
                fillColor: Colors.white,
              ),

              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.deepPurple,
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        textStyle: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold)),
                    onPressed: () {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {

                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.

                        // return _db
                        //     .collection('jobs')
                        //     .where("categoryId", isEqualTo: categoryId)
                        //   .getDocuments()
                        //     .then((v) {
                        //     try{
                        //     v.documents[0].data.update('isApproved', (bool) => true,ifAbsent: ()=>true);

                        db.collection('profile').doc(user!.email).update(
                            {
                              'height': height,
                              'age': age,
                              'weight': weight
                            }
                        );

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Data updated')),
                        );

                      }
                      _controllerHeight.clear();
                      _controllerWeight.clear();
                      _controllerAge.clear();
                    },
                    child: const Text('Submit'),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}