import 'package:rxdart/rxdart.dart';

abstract class BaseBloc {
  final subscription = CompositeSubscription();

  void dispose() {
    subscription.clear();
  }
}
