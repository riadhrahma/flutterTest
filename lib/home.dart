import 'package:flutter/material.dart';
import 'package:fluttertest/view/screens/CardScreen.dart';
import 'package:fluttertest/view/screens/error_page.dart';
import 'package:fluttertest/view/screens/splash_screen.dart';
import 'package:fluttertest/view_model/api/data.dart';
import 'package:fluttertest/view_model/shared_preferences/offline_data.dart';

import 'package:fluttertest/model/extension/exception_message.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Data data = Data();
  OfflineData offlineData = OfflineData();

  Future<void> init() async {
    try {
      await data.fetchData();
      await offlineData.filling();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: AppBarTheme(elevation: 0.0, color: Colors.white),
            scaffoldBackgroundColor: Colors.white),
        home: Stack(
          children: [
            FutureBuilder(
              future: init(),
              builder: (BuildContext context, AsyncSnapshot<void> snapshot) {

                if (snapshot.hasError) {
                  print(snapshot.error.toString());
                  return ErrorPage(
                    error: snapshot.error.toString().showExceptionMessage(),
                  );
                }

                if (snapshot.connectionState == ConnectionState.done) {
                  return CardScreen();
                }
                return SplashScreen();
              },
            ),
          ],
        ));
  }
}
