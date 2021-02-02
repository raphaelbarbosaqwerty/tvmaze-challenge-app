import 'package:flutter_modular/flutter_modular.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/usecases/search_series_by_name.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/usecases/usecases.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/external/datasource/tvmaze_datasource.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/infra/repositories/home_repository_adapter.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/presenter/pages/detail/detail_page.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/presenter/pages/summary/summary_page.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/presenter/pages/summary/summary_store.dart';

import 'presenter/home_page.dart';
import 'presenter/home_store.dart';
import 'presenter/pages/detail/detail_store.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeStore(
          fetchSeriesByPage: i.get(),
          searchSeriesByName: i.get(),
        )),

        Bind((i) => DetailStore(
          fetchSerieEpisodes: i.get(),
        )),

        Bind((i) => SummaryStore(
          fetchEpisodeByParams: i.get(),
        )),

        Bind((i) => FetchSeriesByPage(i.get())),
        Bind((i) => SearchSeriesByName(i.get())),
        Bind((i) => FetchSerieEpisodes(i.get())),
        Bind((i) => FetchEpisodeByParams(i.get())),
        Bind((i) => HomeRepositoryAdapter(i.get())),
        Bind((i) => RemoteTvMazeDatasource(i.get())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => HomePage()),
        ModularRouter('/details/:serieName', child: (_, args) => DetailPage(serieName: args.params['serieName'])),
        ModularRouter('/episode-summary/:episodeName/:serieNumber/:seasonNumber/:episodeNumber', child: (_, args) => SummaryPage(
          episodeName: args.params['episodeName'],
          serieNumber: int.tryParse(args.params['serieNumber']),
          seasonNumber: int.tryParse(args.params['seasonNumber']),
          episodeNumber: int.tryParse(args.params['episodeNumber'])
        ))
      ];

  static Inject get to => Inject<HomeModule>.of();
}
