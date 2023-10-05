import 'dart:convert';

import 'package:apiswork/apis/utilities/app_assets.dart';
import 'package:apiswork/apis/utilities/rest_api_utilities.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/model_post.dart';
import '../services/service_product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<Datum>>? _future;
  Future<List<Datum>>? _futureDate;

  @override
  void initState() {
    super.initState();

    setState(() {
      _future = NamazApiServices.loadPrayerTiming();
      _futureDate = NamazApiServices.loadprayerTimingDate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Center(
            child: Text("APIS", style: TextStyle(color: Colors.white))),
      ),
      backgroundColor: Colors.purple[100],
      body: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: FutureBuilder(
              future: _future,
              builder: (context, AsyncSnapshot<List<Datum>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                      child: const Text(
                    'loading',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ));
                } else {
                  print("objectobjectobject new ${snapshot.data!.length}");
                  return ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        var snap = snapshot.data![index].timings;
                        var dateSnap = snapshot.data![index].date;
                        print(dateSnap?.hijri.toString());

                        return Card(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    child: Text(
                                      "DATE : ${dateSnap?.hijri?.date} Hijri",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20,
                                          color: Colors.black),
                                    ),
                                  ),
                                  Text(
                                    "Fajer : ${snap?.fajr}",
                                    style: const TextStyle(
                                        fontSize: 18, color: Colors.lightBlue),
                                  ),
                                  Text(
                                    "Dhuhr : ${snap?.dhuhr}",
                                    style: const TextStyle(
                                        fontSize: 18, color: Colors.blueAccent),
                                  ),
                                  Text(
                                    "Asar  : ${snap?.asr}",
                                    style: const TextStyle(
                                        fontSize: 18, color: Colors.blue),
                                  ),
                                  Text(
                                    "Maghrib: ${snap?.maghrib}",
                                    style: const TextStyle(
                                        fontSize: 18, color: Colors.cyan),
                                  ),
                                  Text(
                                    "Isha : ${snap?.isha}",
                                    style: const TextStyle(
                                        fontSize: 18, color: Colors.cyanAccent),
                                  ),
                                ]),
                          ),
                        );
                      });
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
