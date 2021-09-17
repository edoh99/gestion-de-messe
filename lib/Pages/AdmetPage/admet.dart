import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gestion_eglise/Pages/AdmetPage/AdmetHome.dart';
import 'package:gestion_eglise/Widgets/AdmetWidgets/ButtonWidget.dart';
import 'package:gestion_eglise/Widgets/AdmetWidgets/annimation.dart';
import 'package:gestion_eglise/shares/globals.dart';
import 'package:provider/provider.dart';

class LoginAdmet extends StatelessWidget {
  showMessage() {
    Text(
      'Contactez l\'administrateur',
      style: TextStyle(color: Colors.redAccent),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    final model = Provider.of<AdmetHome>(context);
    final size = MediaQuery.of(context).size;
    var text = 'Mot de passe oublie ?';

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: size.height - 270,
            color: Global.mediumSarcelle,
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeOutQuad,
            top: keyboardOpen ? -size.height / 3.7 : 0.0,
            child: WaveWidget(
              size: size,
              yOffset: size.height / 3.0,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Administrateur',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextField(
                  cursorColor: Global.mediumSarcelle,
                  decoration: InputDecoration(
                    labelText: 'Nom utilisateur',
                    labelStyle: TextStyle(color: Global.mediumSarcelle),
                    prefixIcon: Icon(
                      Icons.person_outline,
                      size: 18,
                      color: Global.mediumSarcelle,
                    ),
                    suffixIcon: GestureDetector(
                      child: Icon(
                        model.isValid ? Icons.check : null,
                        color: Global.mediumSarcelle,
                        size: 18,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Global.mediumSarcelle),
                    ),
                    filled: true,
                  ),
                  obscureText: false,
                  onChanged: (value) {
                    model.isValidUserName(value);
                  },
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                      cursorColor: Global.mediumSarcelle,
                      decoration: InputDecoration(
                        labelText: 'Mot de passe',
                        labelStyle: TextStyle(color: Global.mediumSarcelle),
                        prefixIcon: Icon(
                          Icons.lock_outlined,
                          size: 18,
                          color: Global.mediumSarcelle,
                        ),
                        suffixIcon: GestureDetector(
                          child: Icon(
                            model.isVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Global.mediumSarcelle,
                            size: 18,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Global.mediumSarcelle),
                        ),
                        filled: true,
                      ),
                      obscureText: model.isVisible ? false : true,
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: showMessage,
                      child: Text(
                        text,
                        style: TextStyle(color: Global.mediumSarcelle),
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
        ],
      ),
    );
  }
}
