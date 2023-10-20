import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_urraan/utils/utils_toast.dart';
import 'package:fire_urraan/widgets/round_button.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AddFirestoreScreen extends StatefulWidget {
  const AddFirestoreScreen({Key? key}) : super(key: key);

  @override
  State<AddFirestoreScreen> createState() => _AddFirestoreScreenState();
}

class _AddFirestoreScreenState extends State<AddFirestoreScreen> {
  bool loading = false;
  final fireStore = FirebaseFirestore.instance.collection('users');
  final postController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add FireStore Data'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              maxLines: 4,
              controller: postController,
              decoration: InputDecoration(
                hintText: 'what is in your mind?',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            RoundButton(
              title: 'Add values',
              loading: loading,
              ontap: () {
                setState(() {
                  loading = true;
                });
                String id = DateTime.now().millisecondsSinceEpoch.toString();
                fireStore.doc(id).set({
                  'title': postController.text.toString(),
                  'id': id,
                }).then((value) {
                  setState(() {
                    loading = false;
                  });
                  UtilsToast().toastmessage('Post added');
                }).onError((error, stackTrace) {
                  setState(() {
                    loading = false;
                  });
                  UtilsToast().toastmessage(error.toString());
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
