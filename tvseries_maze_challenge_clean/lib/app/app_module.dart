import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tvseries_maze_challenge_clean/app/app_widget.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/home_module.dart';

import 'app_store.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppStore()),
        
        // Additionals
        Bind((i) => Dio(BaseOptions(baseUrl: 'http://api.tvmaze.com'))),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
