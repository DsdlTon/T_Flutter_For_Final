import 'package:flutter/material.dart';


class RegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RegisterPageState();
  }
}

class RegisterPageState extends State<RegisterPage> {
  final _formKey = new GlobalKey<FormState>();

  final _userIdControl = new TextEditingController();
  final _passwordControl = new TextEditingController();
  final _rePasswordControl = new TextEditingController();

  void _displayPasswordError() {
    final snackBar = SnackBar(
      content: Text("Please enter same password in both field"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register New Account"),
      ),
      body: ListView(
        key: _formKey,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(3),
            child: TextFormField(
              controller: _userIdControl,
              decoration: InputDecoration(
                  icon: Icon(Icons.account_circle),
                  labelText: "User ID",
                  hintText: "ex. Jason hill"),
              keyboardType: TextInputType.text,
              onSaved: (value) => print(value),
              validator: (value) {
                if (value.isEmpty) {
                  return "Please enter your ID";
                }
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(3),
            child: TextFormField(
              controller: _passwordControl,
              decoration: InputDecoration(
                  icon: Icon(Icons.lock_outline),
                  labelText: "Password",
                  hintText: "ex. Jasonhill5432"),
              keyboardType: TextInputType.text,
              onSaved: (value) => print(value),
              obscureText: true,
              validator: (value) {
                if (value.isEmpty) {
                  return "Please enter your password";
                }
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(3),
            child: TextFormField(
              controller: _rePasswordControl,
              decoration: InputDecoration(
                  icon: Icon(Icons.lock_outline),
                  labelText: "Re-Password",
                  hintText: "ex. Jasonhill5432"),
              keyboardType: TextInputType.text,
              onSaved: (value) => print(value),
              obscureText: true,
              validator: (value) {
              },
            ),
          ),
          Container(
            child: RaisedButton(
              child: Text("Sign up"),
              onPressed: () async {
                _formKey.currentState.validate();
                if(_passwordControl.text !=_rePasswordControl.text) {
                  _displayPasswordError();
                } else {
                  // DatabaseManage db = new DatabaseManage();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
