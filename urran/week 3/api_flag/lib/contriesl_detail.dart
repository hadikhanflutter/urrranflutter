import 'package:flutter/material.dart';
class CountryDetailScreen extends StatefulWidget {
  const CountryDetailScreen({Key? key}) : super(key: key);

  @override
  State<CountryDetailScreen> createState() => _CountryDetailScreenState();
}

class _CountryDetailScreenState extends State<CountryDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('county detail'),

      ),
      body: Placeholder(),


    );
  }
}
