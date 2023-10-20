import 'dart:async';
import 'package:fire_urraan/ui/auth/login_screen.dart';
import 'package:fire_urraan/ui/firestore/firestore_list_screen.dart';
import 'package:fire_urraan/ui/posts/add_posts.dart';
import 'package:fire_urraan/ui/posts/post_screen.dart';
import 'package:fire_urraan/ui/upload_image.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if (user != null) {
      Timer(
          const Duration(seconds: 3),
          () => Navigator.push(
                context,
                MaterialPageRoute(builder: (builder) => const PostScreen()),
              ));
    } else {
      Timer(
          const Duration(seconds: 3),
          () => Navigator.push(
                context,
                MaterialPageRoute(builder: (builder) => const LoginScreen()),
              ));
    }
  }
}
