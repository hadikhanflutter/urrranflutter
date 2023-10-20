import 'package:fire_urraan/ui/auth/login_screen.dart';
import 'package:fire_urraan/utils/utils_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Screen'),
        actions: [
          IconButton(
            onPressed: () {
              auth.signOut().then((value) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              }).onError((error, stackTrace) {
                UtilsToast().toastmessage(error.toString());
              });
            },
            icon: Icon(Icons.login_outlined),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }
}
