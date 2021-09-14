import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:gestion_eglise/Pages/LoginPage/Login.dart';
import 'package:gestion_eglise/Pages/LoginPage/SignUp.dart';
import 'package:gestion_eglise/main.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> googleSignIn() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      if (googleAuth.idToken != null && googleAuth.accessToken != null) {
        final AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

        final UserCredential user =
            await _auth.signInWithCredential(credential);

        await Navigator.pushReplacementNamed(context, "/");

        return user;
      } else {
        throw StateError('Missing Google Auth Token');
      }
    } else
      throw StateError('Sign in Aborted');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Home()),
          );
        },
        child: Icon(
          Icons.home,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 35.0),
            Container(
              height: 400,
              // child: Image(
              //   image: AssetImage("assets/start.jpg"),
              //   fit: BoxFit.contain,
              // ),
            ),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(
                text: 'Bienvenue dans la maison de ',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Dieu',
                    style: TextStyle(
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange),
                  )
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Text(
                'L\'homme, créé par Dieu, ne peut pas connaître la pensée de son Créateur si celui-ci ne lui parle pas. Il est indispensable que Dieu communique avec lui pour expliquer ses actes et révéler ses plans. C\'est pourquoi Dieu a parlé à l\'homme dès l\'origine (Ge 1:28). Cependant la révélation de Dieu est encore plus indispensable depuis la chute, car la pensée de l\'homme pécheur est étrangère à celle de Dieu, elle lui est même opposée (Ep 4:17-20; Col 1:21; Es 55:7-9; cf 2 Co 10:4-5).',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                    // padding: EdgeInsets.only(left: 30, right: 30),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login(),
                        ),
                      );
                    },
                    child: Text(
                      'Se connecter',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.orange),
                SizedBox(width: 20.0),
                RaisedButton(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUp(),
                        ),
                      );
                    },
                    child: Text(
                      'S\'inscrire',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.orange),
              ],
            ),
            SizedBox(height: 20.0),
            SignInButton(
              Buttons.Google,
              text: "Connecte Goolge",
              onPressed: googleSignIn,
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
