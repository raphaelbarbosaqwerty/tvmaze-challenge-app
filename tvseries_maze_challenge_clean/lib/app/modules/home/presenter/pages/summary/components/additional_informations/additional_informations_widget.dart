import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/infra/models/models.dart';

class AdditionalInformationsWidget extends StatelessWidget {
  const AdditionalInformationsWidget({
    Key key,
    @required this.episodeModel,
  }) : super(key: key);

  final ResultFetchEpisodeSummaryModel episodeModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Text('Additional informations', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: HexColor('#3C948B')))),
          Row(
            children: [
              Icon(Icons.access_time, color: HexColor('#3C948B')),
              Padding(
                padding: const EdgeInsets.only(left: 3),
                child: Text('First time: ${episodeModel.airTime}', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Icon(Icons.calendar_today, color: HexColor('#3C948B')),
              Padding(
                padding: const EdgeInsets.only(left: 3),
                child: Text('First date: ${DateFormat("MM/dd/yyyy").format(DateTime.parse(episodeModel.airDate))}', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Icon(Icons.movie_creation, color: HexColor('#3C948B')),
              Padding(
                padding: const EdgeInsets.only(left: 3),
                child: Text('Season: ${episodeModel.season}', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Icon(Icons.slow_motion_video, color: HexColor('#3C948B')),
              Padding(
                padding: const EdgeInsets.only(left: 3),
                child: Text('Episode: ${episodeModel.number}', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}