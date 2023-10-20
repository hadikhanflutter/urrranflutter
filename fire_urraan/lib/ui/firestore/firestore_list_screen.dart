import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_urraan/ui/firestore/add_firestore_data.dart';
import 'package:flutter/material.dart';
import 'package:fire_urraan/ui/auth/login_screen.dart';
import 'package:fire_urraan/ui/posts/add_posts.dart';
import 'package:fire_urraan/utils/utils_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class FireStoreScreen extends StatefulWidget {
  const FireStoreScreen({Key? key}) : super(key: key);

  @override
  State<FireStoreScreen> createState() => _FireStoreScreenState();
}

class _FireStoreScreenState extends State<FireStoreScreen> {
  final auth = FirebaseAuth.instance;
  final editController = TextEditingController();
  final fireStore = FirebaseFirestore.instance.collection('users').snapshots();
  CollectionReference ref = FirebaseFirestore.instance.collection('users');

//here we fetch and collect data from database
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('FireStore Screen'),
        actions: [
          IconButton(
            onPressed: () {
              auth.signOut().then((value) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              }).onError((error, stackTrace) {
                UtilsToast().toastmessage(error.toString());
              });
            },
            icon: const Icon(Icons.login_outlined),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          StreamBuilder<QuerySnapshot>(
              stream: fireStore,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting)
                  return CircularProgressIndicator();
                if (snapshot.hasError) {
                  return Text('Something else');
                }
                return Expanded(
                  child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        String title =
                            snapshot.data!.docs[index]['title'].toString();
                        return ListTile(
                          onTap: () {
                            // ref    // its a direct method to delete and update a value
                            //     .doc(snapshot.data!.docs[index].id.toString())
                            //     .update({'title': 'i am not in flutter'}).then(
                            //         (value) {
                            //   UtilsToast().toastmessage('done');
                            // }).onError((error, stackTrace) {
                            //   UtilsToast().toastmessage(error.toString());
                            // });
                            //ref
                            //     .doc(
                            //         snapshot.data!.docs[index]['id'].toString())
                            //     .delete();
                          },
                          title: Text(
                              snapshot.data!.docs[index]['title'].toString()),
                          subtitle:
                              Text(snapshot.data!.docs[index].id.toString()),
                          trailing: PopupMenuButton(
                            icon: Icon(Icons.more_vert),
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                value: 1,
                                child: ListTile(
                                  onTap: () {
                                    Navigator.pop(context);
                                    showsMyDialog(
                                      title,
                                      snapshot.data!.docs[index].id.toString(),
                                    );
                                  },
                                  leading: Icon(Icons.edgesensor_high_outlined),
                                  title: Text('Edit'),
                                ),
                              ),
                              PopupMenuItem(
                                value: 2,
                                child: ListTile(
                                  onTap: () {
                                    Navigator.pop(context);
                                    ref
                                        .doc(snapshot.data!.docs[index].id
                                            .toString())
                                        .delete();
                                  },
                                  title: Text('Delete'),
                                  leading: Icon(Icons.delete_outline),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                );
              }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AddFirestoreScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> showsMyDialog(String title, String id) async {
    editController.text = title;
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Update'),
            content: Container(
              child: TextField(
                controller: editController,
                decoration: InputDecoration(hintText: 'Edit here'),
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel')),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    ref.doc(id).update({
                      'title': editController.text.toString(),
                    }).then((value) {
                      UtilsToast().toastmessage("post update");
                    }).onError((error, stackTrace) {
                      UtilsToast().toastmessage(error.toString());
                    });
                  },
                  child: Text('Update'))
            ],
          );
        });
  }
}
