import 'package:flutter/material.dart';
import 'package:flutter_musobaqa/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class ProfileAdminScreen extends StatefulWidget {
  const ProfileAdminScreen({super.key});

  @override
  State<ProfileAdminScreen> createState() => _ProfileAdminScreenState();
}

class _ProfileAdminScreenState extends State<ProfileAdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Admin Screen"),
        actions: [
          IconButton(onPressed: (){
            context.read<AuthProvider>().logOutUser(context);
          }, icon:const Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
        ],
      ),
    );
  }
}