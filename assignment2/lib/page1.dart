import 'package:flutter/material.dart';

class MyFirstPage extends StatefulWidget {
  @override
  _MyFirstPageState createState() => _MyFirstPageState();
}

class _MyFirstPageState extends State<MyFirstPage> {
  bool _enabled = false;
  String _msg1 = '';
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    Object onPressed1() {
      if (_enabled) {
        setState(() {
          _msg1 = 'Click Me';
          if (_counter > 0) {
            _msg1 = 'Clicked $_counter';
          }
        });

        print('onPressed1 returning address of anon func but NOT running it');
        print('$_counter');
        return () {
          _incrementCounter();
        };
      } else {
        setState(() {
          _msg1 = '';
        });
        print('onPressed1 returning NULL');
        return null;
      }
    }

    Object onPressed2() {
      if (_enabled) {
        setState(() {
          _msg1 = 'Reset';
        });
        print('onPressed2 returning address of anon func but NOT running it');
        return () {
          print('Anon func now running as button pressed');
          _counter = 0;
          onPressed1();
        };
      } else {
        setState(() {
          _msg1 = '';
        });
        print('onPressed2 returning NULL');
        return null;
      }
    }

    print('The build is being RUN');

    return Scaffold(
      appBar: AppBar(
        title: Text('Button Functionality Demo'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('enable functionality'),
                Switch(
                    value: _enabled,
                    onChanged: (bool onChangedValue) {
                      print('onChangedValue is $onChangedValue');
                      _enabled = onChangedValue;
                      setState(() {
                        if (_enabled) {
                          _msg1 = 'Enabled';
                          print('_enabled is true');
                        } else {
                          _msg1 = '';
                          print('_enabled is false');
                        }
                      });
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(20),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 8,
                    textColor: Colors.red.shade100,
                    color: Colors.redAccent,
                    highlightColor: Colors.blue,
                    splashColor: Colors.green.shade300,
                    padding: EdgeInsets.all(20.0),
                    onPressed: onPressed1(),
                    child: Text(_msg1),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 8,
                    textColor: Colors.red.shade100,
                    color: Colors.blueAccent,
                    highlightColor: Colors.blue,
                    splashColor: Colors.green.shade300,
                    padding: EdgeInsets.all(20.0),
                    onPressed: onPressed2(),
                    child: Text(_msg1),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
