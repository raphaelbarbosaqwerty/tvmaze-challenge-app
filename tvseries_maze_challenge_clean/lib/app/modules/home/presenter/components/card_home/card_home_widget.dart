
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CardHomeWidget extends StatelessWidget {
  final String name;
  final String image;
  
  const CardHomeWidget({
    Key key, this.name, this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 100.0,
            height: 150.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              color: HexColor('#1f4b47'),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              child: Image.network(
                image,
                height: 150.0,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text(name),
          ),
        ],
      ),
    );
  }
}
