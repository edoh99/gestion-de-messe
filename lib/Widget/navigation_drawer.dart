import 'package:flutter/material.dart';
import 'package:gestion_eglise/Pages/contacte.dart';
import 'package:gestion_eglise/Pages/cultes.dart';
import 'package:gestion_eglise/Pages/donnation.dart';
import 'package:gestion_eglise/Pages/programmes.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.blueAccent,
        child: ListView(
          padding: padding,
          children: <Widget>[
            const SizedBox(height: 50),
            buildMenuItem(
              text: 'Programmes',
              icon: Icons.calendar_view_month,
              onClicked: () => selectedItem(context, 0),
            ),
            const SizedBox(height: 5),
            buildMenuItem(
              text: 'Cultes',
              icon: Icons.house_siding_outlined,
              onClicked: () => selectedItem(context, 1),
            ),
            const SizedBox(height: 5),
            buildMenuItem(
              text: 'Donnation',
              icon: Icons.volunteer_activism_outlined,
              onClicked: () => selectedItem(context, 2),
            ),
            const SizedBox(height: 5),
            buildMenuItem(
              text: 'Nous conacter',
              icon: Icons.message_outlined,
              onClicked: () => selectedItem(context, 3),
            ),
            const SizedBox(height: 5),
            buildMenuItem(
              text: 'Admet',
              icon: Icons.https_sharp,
              onClicked: () => selectedItem(context, 4),
            ),
            const SizedBox(height: 15),
            Divider(color: Colors.white),
            const SizedBox(height: 5),
            buildMenuItem(
              text: 'Notification',
              icon: Icons.notification_important_outlined,
              onClicked: () => selectedItem(context, 5),
            ),
            const SizedBox(height: 5),
            buildMenuItem(
              text: 'Partager',
              icon: Icons.share_outlined,
              onClicked: () => selectedItem(context, 6),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    Function()? onClicked,
  }) {
    final color = Colors.white;
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: Colors.white70,
      onTap: onClicked,
    );
  }

  selectedItem(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Programmes(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Cultes(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Donnations(),
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Contacts(),
        ));
        break;
    }
  }
}
