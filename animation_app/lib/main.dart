import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'src/app.dart';

void main() {
  debugPaintSizeEnabled = true; // draws border around the widgets to find layout in the screen
  runApp(App());
}
