import 'package:database/models/dog.dart';
import 'package:database/screens/dog_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class AddDogScreen extends StatefulWidget {
  const AddDogScreen({Key? key}) : super(key: key);

  @override
  State<AddDogScreen> createState() => _AddDogScreenState();
}

class _AddDogScreenState extends State<AddDogScreen> {
  var nameC=TextEditingController();
  var ageC=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Dog'),
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



            }, child: const Text('Save'),),
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return const DogsListScreen();
              }));

                         }, child: const Text('View All'),),



          ],
        ),
      ),



    );

  }
}
