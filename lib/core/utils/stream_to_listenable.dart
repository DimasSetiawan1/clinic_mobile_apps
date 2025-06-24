import 'dart:async';

import 'package:flutter/material.dart';

class StreamToListenable extends ChangeNotifier {
  final List<StreamSubscription> _subscriptions = [];

  StreamToListenable(List<Stream> stream) {
    for (final s in stream) {
      final subscription = s.asBroadcastStream().listen(_tt);
      _subscriptions.add(subscription);
    }
    notifyListeners();
  }

  @override
  void dispose() {
    for (final subscription in _subscriptions) {
      subscription.cancel();
    }
    super.dispose();
  }

  void _tt(event) => notifyListeners();
}
