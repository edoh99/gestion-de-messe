import 'package:flutter/material.dart';
import 'package:gestion_eglise/common/constante.dart';

class AuthentificateForm extends StatefulWidget {
  AuthentificateForm({Key? key}) : super(key: key);

  @override
  _AuthentificateFormState createState() => _AuthentificateFormState();
}

class _AuthentificateFormState extends State<AuthentificateForm> {
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool shouSignIn = true;

  get _auth => null;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void toggleView() {
    setState(() {
      _formKey.currentState!.reset();
      error = '';
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
              shouSignIn ? 'S\'identifier' : 'S\'inscrire',
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
                decoration:
                    textInputDecoration.copyWith(hintText: 'Entrez votre mail'),
                controller: emailController,
                validator: (value) =>
                    value!.isEmpty ? "Entrez votre mail" : null,
              ),
              SizedBox(height: 10.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(
                    hintText: 'Etrez votre mot de passe'),
                controller: passwordController,
                obscureText: true,
                validator: (value) =>
                    value!.length < 6 ? "Mot de passe doit etre > 6" : null,
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    setState(() => loading = true);
                    var password = passwordController.value.text;
                    var email = emailController.value.text;

                    dynamic result = shouSignIn
                        ? await _auth.signInWithEmailAndPassword(
                            email, password)
                        : await _auth.registerWithEmailAndPassword(
                            email, password);
                    if (result == null) {
                      setState(() {
                        error = 'Fournissez un mail correcte';
                      });
                    }
                  }
                },
                child: Text(
                  shouSignIn ? "S'inscrire" : "S'identifier",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 15),
              )
            ],
          ),
        ),
      ),
    );
  }
}
