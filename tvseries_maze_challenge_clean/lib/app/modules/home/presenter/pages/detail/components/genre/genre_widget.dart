import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/entities/entities.dart';

class GenreWidget extends StatelessWidget {
  const GenreWidget({
    Key key,
    @required this.serieModel,
  }) : super(key: key);

  final ResultFetchSerie serieModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Container(
        height: 36,
        child: ListView.builder(
          itemCount: serieModel?.genres?.length ?? 0,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            var genre = serieModel.genres[index];
            return Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: RaisedButton(
                child: Text(genre),
                onPressed: () {},
                color: HexColor('#3C948B'),
              ),
            );
          },
        ),
      ),
    );
  }
}