import 'package:flutter/material.dart';

class IsHomeScreen extends StatefulWidget {
  const IsHomeScreen({Key? key}) : super(key: key);

  @override
  State<IsHomeScreen> createState() => _IsHomeScreenState();
}

class _IsHomeScreenState extends State<IsHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screens'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: Text(
          'Home Screen',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
