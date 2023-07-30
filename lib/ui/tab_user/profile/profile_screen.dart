import 'package:flutter/material.dart';
import 'package:flutter_musobaqa/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Screen"),
        actions: [
          IconButton(onPressed: (){
            context.read<AuthProvider>().logOutUser(context);
          }, icon:const Icon(Icons.logout))
        ],
      ),
    );
  }
}