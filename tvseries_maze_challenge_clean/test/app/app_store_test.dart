import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tvseries_maze_challenge_clean/app/app_module.dart';
import 'package:tvseries_maze_challenge_clean/app/app_store.dart';

void main() {
  initModule(AppModule());
  
  final sut = AppStore();
  test('Should test increment in AppStore', () {
    sut.increment();
    expect(sut.counter.value, 1);
  });
}