import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_musobaqa/provider/auth_provider.dart';
import 'package:flutter_musobaqa/ui/tab_admin/tab_box_admin.dart';
import 'package:flutter_musobaqa/ui/tab_user/tab_box_user.dart';
import 'package:provider/provider.dart';
import 'package:flutter_musobaqa/ui/auth/auth_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: context.read<AuthProvider>().listenAuthState(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          // if (snapshot.connectionState == ConnectionState.waiting) {
          //   return const Center(child: CircularProgressIndicator());
          // }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          else if (snapshot.data == null) {
            return const AuthScreen();
          } else {
            if(snapshot.data!.email=="farruxbek@gmail.com"){
              return const TabBoxAdminScreen();
            }
            return const TabBoxUserScreen();
          }
        },
      ),
    );
  }
}