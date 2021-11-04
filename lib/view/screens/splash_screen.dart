import 'package:flutter/material.dart';
import 'package:fluttertest/global_data/values.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Column(mainAxisSize: MainAxisSize.min,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: Text(appName,style: Theme.of(context).textTheme.headline6,),
      ),
      CircularProgressIndicator()
    ],),),);
  }
}
