import 'package:flutter/material.dart';

class ConnexionAdmet extends StatefulWidget {
  @override
  _ConnexionAdmetState createState() => _ConnexionAdmetState();
}

class _ConnexionAdmetState extends State<ConnexionAdmet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
                  child: Form(
                    child: Column(
                      children: [
                        Container(
                          child: TextFormField(
                            decoration: InputDecoration(labelText: 'Username'),
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Password',
                            ),
                            obscureText: true,
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
