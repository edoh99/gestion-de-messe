import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:collection/collection.dart';
import 'package:gestion_eglise/accueil.dart';
import 'Services/authentification.dart';
import 'Widget/navigation_drawer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GestionEglise());
}

class GestionEglise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        bottomAppBarColor: Colors.teal,
        appBarTheme: AppBarTheme(color: Colors.teal),
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: Colors.teal),
      ),
      home: Home(),
      // routes: {
      //   '../Service/authentification': (context) => Authentificate(),
      // },
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text('Temple'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Authentificate()),
              );
            },
          )
        ],
      ),
      body: Accueil(),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
