import 'package:fire_urraan/utils/utils_toast.dart';
import 'package:fire_urraan/widgets/round_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final emailController = TextEditingController();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot password'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(hintText: 'enter a email'),
            ),
            const SizedBox(
              height: 20,
            ),
            RoundButton(
                ontap: () {
                  auth
                      .sendPasswordResetEmail(
                          email: emailController.text.toString())
                      .then((value) {
                    UtilsToast().toastmessage('We have send email check email');
                  }).onError((error, stackTrace) {
                    UtilsToast().toastmessage(error.toString());
                  });
                },
                title: 'Forgot')
          ],
        ),
      ),
    );
  }
}
