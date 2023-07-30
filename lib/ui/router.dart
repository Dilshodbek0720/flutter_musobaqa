import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_musobaqa/ui/router/admin/admin_dashboard.dart';
import 'package:flutter_musobaqa/ui/router/user/user_screen.dart';
import 'package:flutter_musobaqa/ui/router/welcome/welcome_screen.dart';

class RouterApp extends StatefulWidget {
  const RouterApp({Key? key}) : super(key: key);

  @override
  State<RouterApp> createState() => _RouterAppState();
}

class _RouterAppState extends State<RouterApp> {
  User? user;
  StreamSubscription<User?>? _authStateSubscription;

  @override
  void initState() {
    super.initState();
    _authStateSubscription =
        FirebaseAuth.instance.authStateChanges().listen(updateUserState);
    checkUserRoleAndRoute();
  }

  @override
  void dispose() {
    _authStateSubscription?.cancel();
    super.dispose();
  }

  updateUserState(event) async {
    setState(() {
      user = event;
    });
    await checkUserRoleAndRoute();
  }

  Future<void> checkUserRoleAndRoute() async {
    if (user != null) {
      String uid = user!.uid;
      String role =
          (await FirebaseFirestore.instance.collection('user').doc(uid).get())
                  .data()?['role'] ??
              '';
      if (role == 'admin') {
        setState(() {
          userRoleWidget = const AdminDashboard();
        });
      } else {
        setState(() {
          userRoleWidget = const UserScreen();
        });
      }
    } else {
      setState(() {
        userRoleWidget = const WelcomeScreen();
      });
    }
  }

  Widget? userRoleWidget;

  @override
  Widget build(BuildContext context) {
    if (userRoleWidget == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return userRoleWidget!;
    }
  }
}
