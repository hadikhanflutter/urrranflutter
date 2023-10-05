import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      //theme: ThemeData(

        //primarySwatch: Colors.orange,
      // ),

     theme: ThemeData.dark(),

      home:Scaffold(
        appBar: AppBar(
          title: Text('Flutter Theme'),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: Text('Flutter Theme Work'),


        ),

      )
    );
  }
}

