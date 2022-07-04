import 'package:flutter/foundation.dart';

class Utility {
  void customDebugPrint(String title) {
    if (kDebugMode) debugPrint("\n$title\n", wrapWidth: 1024);
  }
}
