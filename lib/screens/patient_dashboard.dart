import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PatientDashboard extends StatefulWidget {
  static final String id = 'PatientDashboard';
  String title = "SeCURE";

  @override
  _PatientDashboard createState() => _PatientDashboard(title: title);

}

enum Roles { doctor, patient }


class _PatientDashboard extends State<PatientDashboard> {
  _PatientDashboard({Key? key, required title});
  final myController = TextEditingController();

  final ButtonStyle style =
  ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
  );

  // int _counter = 0;
  Roles? _role = Roles.doctor;


  void _nextPage() async {
    final prefs = await SharedPreferences.getInstance();

    if(_role.toString().length > 0 && myController.text.length > 0) {
      prefs.setString('role', _role.toString());
      prefs.setString('atsign', myController.text);
      prefs.setBool('signed_in', true);
    }

    setState(() {

    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
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
        child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0,40.0,20.0,20.0),
                child: CircleAvatar(
                  backgroundColor: Colors.blue.shade800,
                  child: const Text('SC'),
                  radius: 40,
                ),
              ),
              Text('Sarah',
                  style: Theme.of(context).textTheme.headline6),
              Divider(
                height: 20,
                thickness: 1,
                indent: 20,
                endIndent: 20,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,10.0,0,10.0),
                      child: SizedBox(
                        width: 200.0,
                        height: 50.0,
                        child: ElevatedButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) => _buildPopupDialogTransfer(context)
                            );
                          },
                          child: const Text('Transfer Records'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,10.0,0,10.0),
                      child: SizedBox(
                        width: 200.0,
                        height: 50.0,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('View records'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,10.0,0,10.0),
                      child: SizedBox(
                        width: 200.0,
                        height: 50.0,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('My clinicians'),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(80.0), child: Spacer(),)
                  ],
                ),
              )
            ],
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildPopupDialogTransfer(BuildContext context) {
    return new AlertDialog(
      title: const Text('Transfer Patient Records'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Clinician @ sign'
            )
          )
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Send'),
        ),
      ],
    );
  }
}
