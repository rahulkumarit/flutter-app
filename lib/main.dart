import 'package:flutter/material.dart';
import 'package:flutter_app/settings.dart';
import 'package:flutter_app/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _title = 'please login';
  Widget _screen;
  login _login;
  settings _settings;
  bool _authenticated;

  _MyAppState() {
    _login = new login(onSubmit: () {
      submit();
    });
    _settings = new settings();
    _screen = _login;
    _authenticated = false;
  }

  void setAuthenticated(bool auth) {
    if (auth == true) {
      _screen = _settings;
    } else {
      _screen = _login;
    }
  }

  void submit() {
    print('login with: ' + _login.userName + '' + _login.password);
  }

  void go_home() {
    setState(() {
      if (_authenticated == true) {
        _screen = _settings;
      } else {
        _screen = _login;
      }
    });
  }

  void logout() {}

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Login Demo',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(_title),
          actions: <Widget>[
            new IconButton(
                icon: new Icon(Icons.home),
                onPressed: () {
                  go_home();
                }),
            new IconButton(
                icon: new Icon(Icons.exit_to_app),
                onPressed: () {
                  logout();
                }),
          ],
        ),
        body: new settings(),
      ),
    );
  }
}
