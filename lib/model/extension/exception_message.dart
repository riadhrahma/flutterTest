import 'package:fluttertest/global_data/values.dart';

extension ExceptionMessage on String{
  String showExceptionMessage(){
    if(this.contains(linkError)){
      return linkError;
    }
    if(this.contains(noDataSaved)){
      return 'probably there is no data Saved to show in offline mode, pleas verify your internet connection.';
    }
    return unknownError;
  }


}