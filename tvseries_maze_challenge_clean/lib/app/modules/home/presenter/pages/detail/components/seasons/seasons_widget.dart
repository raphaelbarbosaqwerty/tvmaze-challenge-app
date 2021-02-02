import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/entities/entities.dart';

class SeasonsWidget extends StatelessWidget {
  const SeasonsWidget({
    Key key,
    @required this.serieModel,
  }) : super(key: key);

  final ResultFetchSerie serieModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text('Seasons', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: HexColor('#3C948B')))
        ),
        Builder(
          builder: (_) {
            var totalSeasons = [];
            serieModel.episodes.forEach((element) {
              totalSeasons.add(element.season);
            });
            totalSeasons = totalSeasons.toSet().toList();

            return ListView.builder(
              shrinkWrap: true,
              itemCount: totalSeasons.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, indx) {
                return Column(
                  children: [
                    Container(
                      color: HexColor('#1f4b47'),
                      height: 50,
                      width: double.infinity,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Text('${totalSeasons[indx]}º', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                          )
                        ],
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: serieModel.episodes.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        if(totalSeasons[indx] == serieModel.episodes[index].season) {
                          var episode = serieModel.episodes[index];
                          return FlatButton(
                            child: Text('${episode.name} - ${episode.number}'),
                            onPressed: () {
                              Modular.to.pushNamed('/episode-summary/${episode.name}/${serieModel.id}/${episode.season}/${episode.number}');
                            },
                          );
                        } else {
                          return Container();
                        }
                      }
                    ),
                  ],
                );
              }
            );
          }
        ),
      ],
    );
  }
}