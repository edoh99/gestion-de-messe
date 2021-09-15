import 'package:flutter/material.dart';

class BotomBar extends StatefulWidget {
  late final List<String> nomPages;
  late final Function(int valeur) function;

  BotomBar({required this.nomPages, required this.function});

  @override
  _BotomBarState createState() => _BotomBarState();
}

class _BotomBarState extends State<BotomBar> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.lightBlueAccent,
      onTap: (intVar) {
        setState(() {
          index = intVar;
          widget.function(index);
        });
      },
      currentIndex: index,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.info_outline),
          label: widget.nomPages[0],
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.call),
          label: widget.nomPages[1],
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.location_on),
          label: widget.nomPages[2],
        ),
      ],
    );
  }
}
