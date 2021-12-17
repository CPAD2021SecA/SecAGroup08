import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Edit Personal Info';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
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

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    TextEditingController _controllerHeight = TextEditingController();
    TextEditingController _controllerWeight = TextEditingController();
    TextEditingController _controllerAge = TextEditingController();
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0)
          ),
          TextFormField(
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
              padding: EdgeInsets.symmetric(vertical: 16.0)
          ),
          TextFormField(
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
              padding: EdgeInsets.symmetric(vertical: 16.0)
          ),
          TextFormField(
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
              primary: Colors.deepPurple,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              textStyle: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold)),
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
                _controllerHeight.clear();
                _controllerWeight.clear();
                _controllerAge.clear();
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}