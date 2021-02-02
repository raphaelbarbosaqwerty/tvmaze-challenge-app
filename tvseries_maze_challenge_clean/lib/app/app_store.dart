import 'package:rx_notifier/rx_notifier.dart';

class AppStore {

  AppStore();
  
  RxNotifier<int> counter = RxNotifier<int>(0);

  increment() {
    counter.value++;
  }
}