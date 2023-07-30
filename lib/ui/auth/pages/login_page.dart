import 'package:flutter/material.dart';
import 'package:flutter_musobaqa/providers/auth_provider.dart';
import 'package:flutter_musobaqa/ui/auth/widgets/global_button.dart';
import 'package:flutter_musobaqa/ui/auth/widgets/global_text_fields.dart';
import 'package:flutter_musobaqa/ui/auth/widgets/icon_button.dart';

import 'package:flutter_musobaqa/utils/colors/app_colors.dart';
import 'package:flutter_musobaqa/utils/icons/app_icons.dart';
import 'package:flutter_musobaqa/utils/styles/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key, required this.onChanged});
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50.h,),
              SizedBox(
                height: 240.h,
                child: Lottie.asset("assets/svg/tomato.json"),
              ),
              Text(
                "Login to Your Account",
                style: AppStyle.headline.copyWith(fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 30.h,
              ),
              GlobalTextField(
                icon: Icon(Icons.email),
                hintText: "Email",
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
                textAlign: TextAlign.start,
                controller: context.read<AuthProvider>().emailController,
              ),
              GlobalTextField(
                icon: Icon(Icons.lock),
                hintText: "Password",
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
                textAlign: TextAlign.start,
                controller: context.read<AuthProvider>().passwordController,
              ),
              SizedBox(height: 20.h,),
              GlobalButton(title: "Sign in", onTap: (){
                context.read<AuthProvider>().logInUser(context);
              }),
              SizedBox(height: 40.h,),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(height: 1,color: AppColors.black.withOpacity(0.3),width: MediaQuery.of(context).size.width*0.2,),
                    Text("or continue with", style: AppStyle.subhead,),
                    Container(height: 1, color: AppColors.black.withOpacity(0.3),width: MediaQuery.of(context).size.width*0.2,)
                  ],
                ),
              ),
              SizedBox(height: 20.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButtons(onTap: (){ }, icon: AppIcons.facebook),
                  IconButtons(onTap: (){ }, icon: AppIcons.google),
                  IconButtons(onTap: (){ }, icon: AppIcons.apple),
                ],
              ),
              SizedBox(height: 20.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? ", style: AppStyle.body2.copyWith(color: AppColors.black.withOpacity(0.5)),),
                  GestureDetector(
                    onTap: (){
                      onChanged.call();
                      context.read<AuthProvider>().signUpButtonPressed();
                    },
                    child: Text("Sign up"),
                  )
                ],
              ),
              SizedBox(height: 15.h,)
            ],
          ),
        ),
      ),
    );
  }
}