import 'package:flutter/material.dart';

class OtherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Other Screen"),
      ),
      body: Container(
        child: Center(child: Text("Other screen")),
      ),
    );
  }
}
