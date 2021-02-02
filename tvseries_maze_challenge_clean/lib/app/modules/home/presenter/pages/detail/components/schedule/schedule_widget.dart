import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/entities/entities.dart';

class ScheduleWidget extends StatelessWidget {
  const ScheduleWidget({
    Key key,
    @required this.serieModel,
  }) : super(key: key);

  final ResultFetchSerie serieModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text('Schedule', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: HexColor('#3C948B')))
          ),
          Row(
            children: [
              Icon(Icons.access_time, color: HexColor('#3C948B')),
              Padding(
                padding: const EdgeInsets.only(left: 3),
                child: Text('Time: ${serieModel.schedules.time}', style: TextStyle(fontSize: 18)),
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
                child: Text('Days of week', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: serieModel.schedules.days.length,
            itemBuilder: (context, index) {
              return Text('${serieModel.schedules.days[index]}', style: TextStyle(fontSize: 16));
            }
          )
        ],
      ),
    );
  }
}