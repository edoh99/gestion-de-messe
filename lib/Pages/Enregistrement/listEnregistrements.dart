import 'package:flutter/material.dart';

class ListEnregistrements extends StatefulWidget {
  ListEnregistrements({Key? key}) : super(key: key);

  @override
  _ListEnregistrementsState createState() => _ListEnregistrementsState();
}

class _ListEnregistrementsState extends State<ListEnregistrements> {
  @override
  Widget build(BuildContext context) {
    int items = 10;
    //String images = "";

    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Container(
                  height: 150,
                  width: 200,
                  margin: EdgeInsets.only(
                    left: 15,
                    right: items == index ? 20 : 0,
                  ),
                  child: GestureDetector(
                    onTap: () {},
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
