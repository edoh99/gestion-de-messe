import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gestion_eglise/Pages/AdmetPage/AdmetHome.dart';
import 'package:gestion_eglise/Widgets/AdmetWidgets/ButtonWidget.dart';
import 'package:gestion_eglise/Widgets/AdmetWidgets/TextFieldWidget.dart';
import 'package:gestion_eglise/shares/globals.dart';
import 'package:provider/provider.dart';

class LoginAdmet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AdmetHome>(context);
    final nul = null;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            TextFieldWidget(
              hintText: 'Nom utilisateur',
              obscureText: false,
              prefixIconData: Icons.person_outline,
              suffixIconData: model.isValid ? Icons.check : nul,
              onChanged: (value) {
                model.isValidUserName(value);
              },
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextFieldWidget(
                  hintText: 'Mot de passe',
                  obscureText: model.isVisible ? false : true,
                  prefixIconData: Icons.lock_outline,
                  suffixIconData:
                      model.isValid ? Icons.visibility : Icons.visibility_off,
                  onChanged: (value) {
                    // model.isValidPassword(value);
                  },
                ),
                SizedBox(height: 10),
                Text(
                  'Mot de passe oublie ?',
                  style: TextStyle(
                    color: Global.mediumSarcelle,
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            ButtonWidget(
              title: 'Login',
              hasBorder: false,
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
