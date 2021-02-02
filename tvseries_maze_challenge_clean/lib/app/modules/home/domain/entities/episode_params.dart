import 'package:meta/meta.dart';

class EpisodeParams {
  final int serieNumber;
  final int episodeNumber;
  final int seasonNumber;

  EpisodeParams({
    @required this.serieNumber, 
    @required this.episodeNumber, 
    @required this.seasonNumber
  });
}