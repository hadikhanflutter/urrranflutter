import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'model_post.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  var client = http.Client();
  Future<List<ModelPost>>? _future_list;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LoadData();
  }

  @override
  LoadData() async {

    String url =
        'http://api.aladhan.com/v1/calendarByCity/2017/4?city=Abbottabad&country=Pakistan&method=2';
    Uri uri = Uri.parse(url);
    Response response = await client.get(uri);

    if (response.statusCode == 200) {
      setState(() {
        list = modelPostFromMap(response.body) as List<ModelPost>;
      });

      print('get body:${list.length}');
      print('get body:${list[1].status}');
    } else {
      print('get code:${response.statusCode}');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("apis"),
      ),
      body: Container(
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: FutureBuilder(
            future: list,3
            builder: (context,AsyncSnapshot<> snapshot){
              if(snapshot.hasData){
                return Text('$list.fajer')
        }
              
        },
            )
      ),
    );
  }
}
