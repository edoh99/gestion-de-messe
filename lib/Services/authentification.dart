import 'package:flutter/material.dart';
import 'package:gestion_eglise/common/constante.dart';

class Authentificate extends StatefulWidget {
  Authentificate({Key? key}) : super(key: key);
  static const tag = "authentification";
  @override
  _AuthentificateState createState() => _AuthentificateState();
}

class _AuthentificateState extends State<Authentificate> {
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool shouSignIn = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void toggleView() {
    setState(() {
      emailController.text = '';
      passwordController.text = '';
      shouSignIn = !shouSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 3,
        title: Text(shouSignIn ? 'Connexion' : 'Creer compte'),
        actions: <Widget>[
          TextButton.icon(
            onPressed: () => toggleView(),
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: Text(
              shouSignIn ? 'Sign' : 'Register',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'email'),
                controller: emailController,
                validator: (value) =>
                    value!.isEmpty ? "Entrez votre mail" : null,
              ),
              SizedBox(height: 10.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'password'),
                controller: passwordController,
                obscureText: true,
                validator: (value) =>
                    value!.length < 6 ? "Entrez votre mail" : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
