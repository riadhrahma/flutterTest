import 'package:flutter/material.dart';


class ErrorPage extends StatelessWidget {
  final String error;
  const ErrorPage({Key key, this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(error),

          ],
        ),
      ),
    ),),);
  }
}
