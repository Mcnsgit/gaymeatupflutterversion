import 'package:flutter/foundation.dart';

class AppBarNotifier extends ChangeNotifier {
  String _title = 'Default Title';

  String get title => _title;

  void updateTitle(String newTitle) {
    _title = newTitle;
    notifyListeners();
  }
}
