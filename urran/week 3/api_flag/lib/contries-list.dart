import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_svg/svg.dart';

import 'country.dart';

class CountryListScreen extends StatefulWidget {
  const CountryListScreen({Key? key}) : super(key: key);

  @override
  State<CountryListScreen> createState() => _CountryListScreenState();
}

class _CountryListScreenState extends State<CountryListScreen> {
  Future<List<Country>> getAllCountries() async {
    String url = 'https://countriesnow.space/api/v0.1/countries/flag/images';
    var response = await http.get(Uri.parse(url));
    if (response == 200) {
      var jsonResponse = json.decode(response.body);
      var jsonArray = jsonResponse['data'];
      List<Country> countries = [];

      for (var jsonCountry in jsonArray) {
        Country country = Country.fromMap(jsonCountry);
        countries.add(country);
      }
      return countries;
    } else {
      return <Country>[];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('country list'),
        ),
        body: Placeholder());
  }
}
