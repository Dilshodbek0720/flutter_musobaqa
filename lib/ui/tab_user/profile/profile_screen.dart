import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_musobaqa/provider/auth_provider.dart';
import 'package:flutter_musobaqa/provider/profiles_provider.dart';
import 'package:flutter_musobaqa/ui/auth/widgets/global_button.dart';
import 'package:flutter_musobaqa/utils/colors/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:flutter_musobaqa/ui/auth/widgets/global_text_fields.dart';


class ProfileUserScreen extends StatefulWidget {
  const ProfileUserScreen({Key? key}) : super(key: key);

  @override
  State<ProfileUserScreen> createState() => _ProfileUserScreenState();
}

class _ProfileUserScreenState extends State<ProfileUserScreen> {
  bool isEdit = false;

  @override
  Widget build(BuildContext context) {
    User? user = context.watch<ProfileProvider>().currentUser;

    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(

        backgroundColor: Colors.black,
        title: const Text("Profile Screen"),
        actions: [
          IconButton(
              onPressed: () {
                context.read<AuthProvider>().logOutUser(context);
              },
              icon: const Icon(Icons.logout),)
        ],
      ),
      body:  Padding(
        padding: const EdgeInsets.all(24),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "My profile",
                  style: TextStyle(
                      fontSize: 32.spMin,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        isEdit = !isEdit;
                      });
                    },
                    icon: Icon(
                      Icons.edit,
                      size: 32.spMin,
                      color: Colors.black,
                    ),)
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Center(
              child: Icon(
                Icons.person,
                size: 80.h,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Display name  : ",
                  style: TextStyle(
                      fontSize: 20.spMin,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,),
                ),
                Center(
                  child: Text(
                    user?.displayName ?? "",
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Email address  : ",
                  style: TextStyle(
                      fontSize: 20.spMin,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      user?.email ?? "",
                      style: TextStyle(
                        fontSize: 14.spMin,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Phone number  : ",
                  style: TextStyle(
                      fontSize: 20.spMin,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,),
                ),
                Center(
                  child: Text(
                    user?.phoneNumber ?? "Empty",
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            Visibility(
              visible: isEdit,
              child: Column(
                children: [
                  GlobalTextField(
                    icon: const Icon(Icons.drive_file_rename_outline),
                    hintText: "Display Name",
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    textAlign: TextAlign.start,
                    controller:
                    context.read<ProfileProvider>().nameController,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  GlobalTextField(
                    hintText: "Email Update",
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    textAlign: TextAlign.start,
                    controller:
                    context.read<ProfileProvider>().emailController, icon: const Icon(Icons.email),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  GlobalTextField(
                    icon: const Icon(Icons.phone),
                    hintText: "Phone Update",
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    textAlign: TextAlign.start,
                    controller:
                    context.read<ProfileProvider>().phoneController,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  GlobalButton(
                      title: "Save",
                      onTap: () {
                        context
                            .read<ProfileProvider>().updateUsername(context);
                        context
                            .read<ProfileProvider>()
                            .updateEmail(context);
                        // context.read<ProfileProvider>().updateEmail(context);
                        setState(() {
                          isEdit = false;
                        });
                      },)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
