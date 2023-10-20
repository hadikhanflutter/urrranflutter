import 'package:flutter/material.dart';

class VerifyCodeScreen extends StatefulWidget {
  final String verifictionId;
  const VerifyCodeScreen({Key? key, required this.verifictionId})
      : super(key: key);

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('verify code'),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
