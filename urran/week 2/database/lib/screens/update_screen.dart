import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../models/dog.dart';
class DogsUpdaterScreen extends StatefulWidget {
  const DogsUpdaterScreen({Key? key}) : super(key: key);

  @override
  State<DogsUpdaterScreen> createState() => _DogsUpdaterScreenState();
}

class _DogsUpdaterScreenState extends State<DogsUpdaterScreen> {
  var nameC=TextEditingController();
  var ageC=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Dog'),
      ),
      body:Padding(

        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: nameC,
              decoration: const InputDecoration(
                hintText: 'Dog Name',
              ),
            ),
            const SizedBox(height: 15,),
            TextField(
              keyboardType: TextInputType.number ,
              controller: ageC,
              decoration: const InputDecoration(
                hintText: 'Dog Age',
              ),
            ),
            const SizedBox(height: 15,),

            ElevatedButton(onPressed: (){
              String name = nameC.text;
              String age = ageC.text;
              if(name.isEmpty || age.isEmpty){
                Fluttertoast.showToast(msg: 'Please provide values');
              }
              else{
                Dog dog = Dog(name: name,age: int.parse(age));
              }



            }, child: const Text('Update'),),




          ],
        ),
      ),


    );

  }
}
