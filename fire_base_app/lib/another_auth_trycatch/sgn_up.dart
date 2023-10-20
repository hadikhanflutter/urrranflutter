import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ndialog/ndialog.dart';

class SgnScreen extends StatefulWidget {
  const SgnScreen({Key? key}) : super(key: key);

  @override
  State<SgnScreen> createState() => _SgnScreenState();
}

class _SgnScreenState extends State<SgnScreen> {
  @override
  Widget build(BuildContext context) {
    var fullNameController = TextEditingController();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var confirmpasswordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: fullNameController,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                hintText: 'FullName',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                hintText: 'Email',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                hintText: 'Password',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: confirmpasswordController,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                hintText: 'Confrim password',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  var fullName = fullNameController.text.trim();
                  var email = emailController.text.trim();
                  var password = passwordController.text.trim();
                  var confirmpassword = confirmpasswordController.text.trim();

                  if (fullName.isEmpty ||
                      email.isEmpty ||
                      password.isEmpty ||
                      confirmpassword.isEmpty) {
                    //  show toast
                    Fluttertoast.showToast(msg: 'Please fill all fields');
                    return;
                  }
                  if (password.length < 6) {
                    Fluttertoast.showToast(msg: 'weak password');
                    return;
                  }
                  if (password != confirmpassword) {
                    Fluttertoast.showToast(msg: 'password do not match');
                    return;
                  }
                  ProgressDialog progressDialog = ProgressDialog(
                    context,
                    title: const Text('Signing Up'),
                    message: const Text('Please wait'),
                  );
                  progressDialog.show();

                  try {
                    FirebaseAuth auth = FirebaseAuth.instance;
                    UserCredential userCredential =
                        await auth.createUserWithEmailAndPassword(
                            email: email, password: password);
                    if (userCredential != null) {
                      Fluttertoast.showToast(msg: 'Success');
                    } else {
                      Fluttertoast.showToast(msg: 'Failed');
                    }
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'email-already-in-use') {
                      Fluttertoast.showToast(msg: 'email-already-in-use');
                    } else if (e.code == 'weak-password') {
                      Fluttertoast.showToast(msg: 'weak password');
                    }
                  } catch (e) {
                    Fluttertoast.showToast(msg: 'Something wrong');
                  }
                  progressDialog.dismiss();
                },
                child: const Text('Sign Up'))
          ],
        ),
      ),
    );
  }
}
