import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter/rendering.dart';

class Accueil extends StatefulWidget {
  @override
  _AccueilState createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    CollectionReference infos = FirebaseFirestore.instance.collection('infos');

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 400,
                height: 150,
              ),
              Container(
                child: CarouselSlider(
                  items: [
                    newImages('assets/bible.png'),
                    newImages('assets/images.jpg'),
                    newImages('assets/bible.png'),
                    newImages('assets/images.jpg'),
                    newImages('assets/bible.png'),
                    newImages('assets/bible.png'),
                  ],
                  options: CarouselOptions(
                    height: 200,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 5),
                    autoPlayAnimationDuration: Duration(milliseconds: 1800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.all(5),
            width: 400,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black54,
            ),
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'En se moment au temple',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),

          //****************************** Liste des cultes ******************/
        ],
      ),
    );
  }

  Container newImages(image) {
    return Container(
      child: Stack(
        children: [
          Opacity(
            opacity: 0.5,
            child: Container(
              margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(image),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
