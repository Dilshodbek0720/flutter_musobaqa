import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_musobaqa/providers/auth_provider.dart';

import 'package:flutter_musobaqa/ui/router.dart';

import 'package:flutter_musobaqa/providers/tab_provider.dart';

import 'package:flutter_musobaqa/ui/splash/splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:flutter_musobaqa/data/firebase/auth_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseDatabase.instance.setPersistenceEnabled(true);
  FirebaseDatabase.instance.reference().keepSynced(true);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(firebaseServices: AuthService()),
          lazy: true,
        ),
        ChangeNotifierProvider(
          create: (context) => TabProvider(),
          lazy: true,
        ),
        // ChangeNotifierProvider(
        //   create: (context) =>
        //       ProfileProvider(profileService: ProfileService()),
        //   lazy: true,
        // ),
        // ChangeNotifierProvider(
        //   create: (context) =>
        //       CategoryProvider(categoryService: CategoryService()),
        //   lazy: true,
        // ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: child,
          theme: ThemeData.light(),
        );
      },
      child: RouterApp(),
    );
  }
}
