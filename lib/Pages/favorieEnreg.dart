import 'package:flutter/material.dart';

class FavorieEnreg extends StatefulWidget {
  FavorieEnreg({Key? key}) : super(key: key);

  @override
  _FavorieEnregState createState() => _FavorieEnregState();
}

class _FavorieEnregState extends State<FavorieEnreg> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 4.0,
      right: 12.0,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          color: Colors.white.withOpacity(0.7),
        ),
      ),
    );
  }
}
