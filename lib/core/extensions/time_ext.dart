import 'package:flutter/material.dart';

extension TimeExt on TimeOfDay {
  String get timeOfDayToString {
    // if (this == null) return '';
    String hour = this.hour.toString().padLeft(2, '0');
    String minute = this.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}
