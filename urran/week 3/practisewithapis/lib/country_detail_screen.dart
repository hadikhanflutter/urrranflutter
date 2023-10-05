import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:practisewithapis/model.dart';
import 'country_list_screen.dart';

class CountryDetailScreen extends StatefulWidget {
  const CountryDetailScreen({Key? key, required Country country})
      : super(key: key);

  @override
  State<CountryDetailScreen> createState() => _CountryDetailScreenState();
}

class _CountryDetailScreenState extends State<CountryDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Screen"),
      ),
      body: Placeholder(),
    );
  }
}
