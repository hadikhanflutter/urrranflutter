import 'package:flutter/material.dart';
class DogsListScreen extends StatefulWidget {
  const DogsListScreen({Key? key}) : super(key: key);

  @override
  State<DogsListScreen> createState() => _DogsListScreenState();
}

class _DogsListScreenState extends State<DogsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dogs Lists'),
      ),
      
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context,index){
          return Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    color: Colors.red,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Dog name'),
                          Text('Dog Age'),
                        ],
                      ),
                  ),
                ),
                Column(
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.edit),),
                    IconButton(onPressed: (){}, icon: Icon(Icons.delete),),


                  ],

                ),
              ],
            ),
          );
        },
      ),



    );

  }
}
