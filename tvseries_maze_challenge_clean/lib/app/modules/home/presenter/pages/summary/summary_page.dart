import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/entities/entities.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/errors/errors.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/infra/models/models.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/presenter/pages/components/custom_error/custom_error_widget.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/presenter/pages/components/header_image/header_image_widget.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/presenter/pages/summary/components/components.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/presenter/pages/summary/states/summary_state.dart';

import 'package:tvseries_maze_challenge_clean/app/modules/home/presenter/pages/summary/summary_store.dart';

class SummaryPage extends StatefulWidget {
  final String episodeName;
  final int serieNumber;
  final int seasonNumber;
  final int episodeNumber;
  
  SummaryPage({
    Key key,
    this.episodeName,
    this.serieNumber,
    this.seasonNumber,
    this.episodeNumber,
  }) : super(key: key);

  @override
  _SummaryPageState createState() => _SummaryPageState();
}

class _SummaryPageState extends ModularState<SummaryPage, SummaryStore> {
  SummaryStore store;
  ResultFetchEpisodeSummaryModel episodeModel;

  @override
  void initState() {
    super.initState();
    store = controller;
  }

  @override
  Widget build(BuildContext context) {
    store.fetchEpisode(EpisodeParams(
      serieNumber: widget.serieNumber, 
      seasonNumber: widget.seasonNumber, 
      episodeNumber: widget.episodeNumber
    ));

    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(children: [
            TextSpan(
              text: '${widget.episodeName}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: ' - S${widget.seasonNumber}E${widget.episodeNumber}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ]),
        ),
      ),
      body: SingleChildScrollView(
        child: RxBuilder(
          builder: (_) {
            var state = store.state;

            if(state.value is ErrorState) {
              return CustomErrorWidget(error: state.value.error as Failure);
            }
            
            if(state.value is SuccessState) {
              episodeModel = state.value.episode;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderImageWidget(image: episodeModel?.image?.original),
                  Padding(
                    padding: EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 10),
                    child: Column(
                      children: [
                        Center(child: Text('Episode Summary', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: HexColor('#3C948B')))),
                        Text(episodeModel.summary, style: TextStyle(fontSize: 16)),
                        AdditionalInformationsWidget(episodeModel: episodeModel),
                      ],
                    ),
                  ),
                ],
              );
            } else if(state.value is LoadingState) {
              return Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return Container();
            }
          }
        )
      ),
    );
  }
}