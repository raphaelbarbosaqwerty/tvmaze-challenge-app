import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class HeaderImageWidget extends StatelessWidget {
  const HeaderImageWidget({
    Key key,
    @required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: HexColor('#1f4b47'),
      child: Center(
        child: Container(
          height: 250.0,
          child: ClipRRect(
            child: Image.network(
              image == null ? 'https://bitsofco.de/content/images/2018/12/broken-1.png' : image,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}