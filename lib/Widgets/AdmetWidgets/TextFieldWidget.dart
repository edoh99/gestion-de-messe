import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestion_eglise/Pages/AdmetPage/AdmetHome.dart';
import 'package:gestion_eglise/shares/globals.dart';
import 'package:provider/provider.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final IconData? prefixIconData;
  final IconData? suffixIconData;
  final bool obscureText;
  final Function onChanged;

  TextFieldWidget({
    required this.hintText,
    required this.prefixIconData,
    required this.suffixIconData,
    required this.obscureText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AdmetHome>(context);
    return TextField(
      style: TextStyle(
        fontSize: 14,
      ),
      cursorColor: Global.mediumSarcelle,
      decoration: InputDecoration(
        labelText: hintText,
        prefixIcon: Icon(
          prefixIconData,
          size: 18,
          color: Global.mediumSarcelle,
        ),
        filled: true,
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Global.mediumSarcelle),
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            model.isVisible = !model.isVisible;
          },
          child: Icon(
            suffixIconData,
            size: 18,
            color: Global.mediumSarcelle,
          ),
        ),
        labelStyle: TextStyle(color: Global.mediumSarcelle),
      ),
    );
  }
}
