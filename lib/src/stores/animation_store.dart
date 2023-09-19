import 'package:flutter/material.dart';

class AnimationStore extends ChangeNotifier {
  double _tabAnimationValue = 0.0;

  double get animationValue => _tabAnimationValue;

  void updateTabAnimationValue(double newValue) {
    _tabAnimationValue = newValue;
    notifyListeners();
  }
}
