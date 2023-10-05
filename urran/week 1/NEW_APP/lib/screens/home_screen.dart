import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var fullName='';
  var firstController = TextEditingController();
  var lastController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'home screen',
            style: TextStyle(fontSize: 30),
          ),
        ),
        body:  Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            FlutterLogo(
                              size: 80,
                            ),
                            Text(
                              'Flutter',
                              style: TextStyle(fontSize: 50, color: Colors.grey),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextField(
                          controller: firstController,
                          decoration: InputDecoration(
                            hintText: 'First Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: lastController,
                          decoration: InputDecoration(
                            hintText: 'Last Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )
                                  ),
                                  onPressed: () {
                                    firstController.clear();
                                    lastController.clear();
                                    setState(() {
                                      fullName ='';
                                    });
                                  },
                                  child: Text(
                                    'Clear',
                                  ),),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )
                                ),
                                onPressed: () {
                                  String firstName = firstController.text;
                                  String lastName = lastController.text;
                                 setState(() {
                                   fullName = '$firstName $lastName';
                                 });
                                },
                                child: Text(
                                  'Concat',
                                ),),
                            ),

                          ],
                        ),
                        Text(fullName),
                      ],
                    ),
                  ],
                ),
          ),
        ),
    );
  }
}

/*
SizedBox(
              width: 100,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.yellow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: Text('Loogin'),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text('favourite'),
            ),
            OutlinedButton(
              onPressed: () {},
              child: Text('good'),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.shopping_cart),
              label: Text('Shopping cart'),
            ),
 */
/*
FaIcon(
              FontAwesomeIcons.whatsapp,
              size: 50,
            ),
            Icon(
              Icons.shopping_bag,
              color: Colors.red,
              size: 100,
            ),
            Icon(
              Icons.settings,
              color: Colors.red,
              size: 100,
            ),
            Icon(
              Icons.flutter_dash,
              color: Colors.red,
              size: 100,
            ),
            Container(
              color: Colors.red,
              child: Image.asset(
                'images/hadi.jpg',
                width: 300,
                height: 300,
                fit: BoxFit.fill,
              ),
            ),
            CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 100,
              backgroundImage: AssetImage(
                'images/hadi.jpg',
              ),
            ),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(
                    'images/hadi.jpg',
                  ))),
            ),
 */
/*
Container(
        color: Colors.amberAccent,

        height: 100,
        child: Row(
          mainAxisAlignment:MainAxisAlignment.spaceEvenly,

          children: [
            Container(
              width: 50,
              height: 50,
              color: Colors.blueAccent                                        ,
            ),

            Container(
              width: 50,
              height: 50,
              color: Colors.red,
            ),
            Container(
              width: 50,
              height: 50,
              color: Colors.green,
            ),
          ],
        ),
      ),
 */

/* Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: 200,
        width: 200,
        alignment: Alignment.center,
        decoration: BoxDecoration(

            gradient: LinearGradient(
              colors: [
                Colors.blueAccent,
                Colors.lightGreenAccent,
                Colors.yellow,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,

            ),
            boxShadow: [
              BoxShadow(
                color: Colors.red,
                blurRadius: 6.0,
                spreadRadius: 5,
              )
            ],

            border: Border.all(color: Colors.black,width: 5,),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),

            )),
        child: Text(
          'New App',
          style: TextStyle(fontSize: 20),
        ),
      ),
      */

/*const Text(
        'hello world',
        style: TextStyle(
          color: Colors.green,
          fontSize: 50,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          wordSpacing: 50,
          letterSpacing: 10,
        ),
      ),*/
