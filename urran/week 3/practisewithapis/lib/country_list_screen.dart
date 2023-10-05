import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

import 'model.dart';

class CountryListScreen extends StatefulWidget {
  const CountryListScreen({Key? key}) : super(key: key);

  @override
  State<CountryListScreen> createState() => _CountryListScreenState();
}

class _CountryListScreenState extends State<CountryListScreen> {
  Future<List<Country>> getAllCountries() async {
    const url = 'https://countriesnow.space/api/v0.1/countries/flag/images';

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);

      var jsonCountries = jsonResponse['data'];

      List<Country> countries = [];
      for (var jsonCountry in jsonCountries) {
        Country country = Country.fromJson(jsonCountry);
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
        title: const Text('Country List'),
      ),
      body: FutureBuilder<List<Country>>(
        future: getAllCountries(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            List<Country> countries = snapshot.data!;

            return ListView.builder(
                itemCount: countries.length,
                itemBuilder: (context, index) {
                  Country country = countries[index];

                  return Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                            width: 100,
                            height: 80,
                            child: SvgPicture.network(
                              country.flag,
                              fit: BoxFit.cover,
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          country.name,
                          style: const TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  );
                });
          }
        },
      ),
    );
  }
}
