import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/products_model.dart';

class ExampleLastScreen extends StatefulWidget {
  const ExampleLastScreen({Key? key}) : super(key: key);

  @override
  State<ExampleLastScreen> createState() => _State();
}

class _State extends State<ExampleLastScreen> {
  Future<ProductsModel> getProductApi() async {
    final response = await http.get(
        Uri.parse('https://webhook.site/8afa041b-191f-4bec-b176-e026be1a019f'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return ProductsModel.fromJson(data);
    } else {
      return ProductsModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('apis'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<ProductsModel>(
                future: getProductApi(),
                builder: (context, AsyncSnapshot<ProductsModel> snapshot) {
                  if (!snapshot.hasData) {
                    return Text('loading');
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.data!.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Text(index.toString()),
                            ],
                          );
                        });
                  }
                }),
          )
        ],
      ),
    );
  }
}
