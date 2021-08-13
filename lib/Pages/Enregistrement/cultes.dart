import 'package:flutter/material.dart';
import 'package:gestion_eglise/Pages/Enregistrement/views/recorder_home_view.dart';
import 'package:gestion_eglise/main.dart';

class Cultes extends StatefulWidget {
  @override
  _CultesState createState() => _CultesState();
}

class _CultesState extends State<Cultes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RecorderHomeView(title: 'Cultes'),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        child: Container(
          //color: Colors.black38,
          child: BottomAppBar(
            shape: CircularNotchedRectangle(),
            child: Row(
              children: [
                Spacer(),
                IconButton(
                  onPressed: () {},
                  color: Colors.white,
                  icon: Icon(Icons.add_alert),
                ),
                Spacer(),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  color: Colors.white,
                  icon: Icon(Icons.turned_in),
                ),
                Spacer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
