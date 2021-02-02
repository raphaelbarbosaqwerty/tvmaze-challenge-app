import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/entities/entities.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/errors/errors.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/presenter/pages/components/components.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/presenter/pages/detail/components/components.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/presenter/pages/detail/detail_store.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/presenter/pages/detail/states/detail_state.dart';

class DetailPage extends StatefulWidget {
  final String serieName;

  DetailPage({
    Key key,
    this.serieName,
  }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends ModularState<DetailPage, DetailStore> {
  DetailStore store;
  ResultFetchSerie serieModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    store = controller;
    store.setSerieName(widget.serieName);
  }

  @override
  Widget build(BuildContext context) {
    controller.getEpisodes();
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.serieName}'),
      ),
      body: SingleChildScrollView(
        child: RxBuilder(
          builder: (_) {
            var state = store.state;

            if(state.value is ErrorState) {
              return CustomErrorWidget(error: state.value.error as Failure);
            }

            if(state.value is SuccessState) {
              serieModel = state.value.resultFetchSerie;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderImageWidget(image: serieModel?.image?.medium),
                  GenreWidget(serieModel: serieModel),
                  Padding(
                    padding: EdgeInsets.only(left: 15, top: 10, right: 15),
                    child: Column(
                      children: [
                        Center(child: Text('Summary', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: HexColor('#3C948B')),)),
                        Text(serieModel.summary, style: TextStyle(fontSize: 16)),
                        ScheduleWidget(serieModel: serieModel),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                          child: SeasonsWidget(serieModel: serieModel),
                        ),
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
          },
        ),
      ),
    );
  }
}