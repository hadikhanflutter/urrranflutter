import 'package:fire_urraan/utils/utils_toast.dart';
import 'package:fire_urraan/widgets/round_button.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AddPosts extends StatefulWidget {
  const AddPosts({Key? key}) : super(key: key);

  @override
  State<AddPosts> createState() => _AddPostsState();
}

class _AddPostsState extends State<AddPosts> {
  @override
  Widget build(BuildContext context) {
    bool loading = false;
    final postController = TextEditingController();
    final dataBaseRef = FirebaseDatabase.instance.ref('Post');

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Posts'),
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
                dataBaseRef.child(id).set({
                  'title': postController.text.toString(),
                  'id': id,
                }).then((value) {
                  setState(() {
                    loading = false;
                  });
                  UtilsToast().toastmessage('post added');
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
