import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static final String id = 'LoginScreen';
  String title = "Sheesh";



  @override
  _LoginScreen createState() => _LoginScreen(title: title);

}

enum Roles { doctor, patient }


class _LoginScreen extends State<LoginScreen> {
  _LoginScreen({Key? key, required title});


  // int _counter = 0;
  Roles? _role = Roles.doctor;


  void _nextPage() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      // _counter++;
    });
  }



  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
          child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: (Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Welcome to SeCURE',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30.0, 0, 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 40.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'My @sign is'
                            ),
                          ),
                        ),
                        Text(
                          'I am a...',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        ListTile(
                          title: const Text('Doctor'),
                          leading: Radio<Roles>(
                            value: Roles.doctor,
                            groupValue: _role,
                            onChanged: (Roles? value) {
                              setState(() {
                                _role = value;
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: const Text('Patient'),
                          leading: Radio<Roles>(
                            value: Roles.patient,
                            groupValue: _role,
                            onChanged: (Roles? value) {
                              setState(() {
                                _role = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
              )
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _nextPage,
        tooltip: 'Next Page',
        child: Icon(Icons.arrow_right_alt),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
