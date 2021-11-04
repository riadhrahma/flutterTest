import 'package:fluttertest/global_data/values.dart';

extension DataErrorHandle on int {
  String showError() {
    switch (this) {
      case 404:
        {
          return linkError;
        }
      default:
        {
          return unknownError;
        }
    }
  }
}
