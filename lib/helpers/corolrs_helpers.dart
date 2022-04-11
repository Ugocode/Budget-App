import 'package:flutter/material.dart';

getColor(BuildContext context, double percent) {
  if (percent >= 0.5) {
    return Theme.of(context).primaryColor;
  } else if (percent >= 0.25) {
    return Colors.orange;
  } else if (percent <= 0.5) {
    return Color.fromARGB(255, 244, 67, 54);
  }
}
