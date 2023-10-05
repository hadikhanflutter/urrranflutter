import 'package:flutter/material.dart';

class ListviewScreen extends StatefulWidget {
  const ListviewScreen({Key? key}) : super(key: key);

  @override
  State<ListviewScreen> createState() => _ListviewScreenState();
}

class _ListviewScreenState extends State<ListviewScreen> {
  final plList= ['kah','kk','akdh'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Listview Example'),
        ),
        body: 
  }
}
/*
ListView.builder(
          itemCount: 10,

            itemBuilder: (context,index){
              return Container(
                  height: 250,

                  color: Colors.amber,
                  margin: EdgeInsets.only(bottom: 10),
                  alignment: Alignment.center,
                  child: Text('$index'));
            })
 */
/*
GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,

        ),

        children: [


          Container(

            width: 220,
            height: 220,
            color: Colors.blue,
          ),
          Container(
            width: 220,
            height: 220,
            color: Colors.black,
          ),
          Container(
            width: 220,
            height: 220,
          ),
          Container(
            width: 120,
            height: 120,
            color: Colors.amber,
          ),
          Container(
            width: 120,
            height: 120,
            color: Colors.lightGreenAccent,
          ),
          Container(
            width: 220,
            height: 220,
          ),
          Container(
            width: 120,
            height: 120,
            color: Colors.amber,
          ),
          Container(
            width: 120,
            height: 120,
            color: Colors.lightGreenAccent,
          ),











        ],
      )
 */
