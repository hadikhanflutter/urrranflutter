import 'package:fire_urraan/ui/auth/verify_code.dart';
import 'package:fire_urraan/utils/utils_toast.dart';
import 'package:fire_urraan/widgets/round_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginWithPhone extends StatefulWidget {
  const LoginWithPhone({Key? key}) : super(key: key);

  @override
  State<LoginWithPhone> createState() => _LoginWithPhoneState();
}

class _LoginWithPhoneState extends State<LoginWithPhone> {
  bool loading = false;

  final phoneNumberController = TextEditingController();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            TextFormField(
              controller: phoneNumberController,
              decoration: InputDecoration(
                  hintText: '+124 234 568',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
            const SizedBox(
              height: 80,
            ),
            RoundButton(
              ontap: () {
                auth.verifyPhoneNumber(
                    phoneNumber: phoneNumberController.text,
                    verificationCompleted: (_) {},
                    verificationFailed: (e) {
                      UtilsToast().toastmessage(e.toString());
                    },
                    codeSent: (String verifcationId, int? token) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VerifyCodeScreen(
                                    verifictionId: verifcationId,
                                  )));
                    },
                    codeAutoRetrievalTimeout: (e) {
                      UtilsToast().toastmessage(e.toString());
                    });
              },
              title: 'Login',
            ),
          ],
        ),
      ),
    );
  }
}
