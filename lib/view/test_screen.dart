import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.blueGrey
      ),
      home:  const Scaffold(
          body: Center(
        child: Text("vfv")
      )),
    );
  }
}
