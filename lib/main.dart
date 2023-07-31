import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_musobaqa/data/firebase/category_service.dart';
import 'package:flutter_musobaqa/data/firebase/product_service.dart';
import 'package:flutter_musobaqa/providers/auth_provider.dart';
import 'package:flutter_musobaqa/providers/category_provider.dart';
import 'package:flutter_musobaqa/providers/product_provider.dart';
import 'package:flutter_musobaqa/providers/profile_provider.dart';
import 'package:flutter_musobaqa/providers/tab_admin_provider.dart';
import 'package:flutter_musobaqa/providers/tab_user_provider.dart';
import 'package:flutter_musobaqa/ui/splash/splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'data/firebase/auth_service.dart';
import 'data/firebase/profile_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(firebaseServices: AuthService()),
          lazy: true,
        ),
        ChangeNotifierProvider(
          create: (context) => TabAdminProvider(),
          lazy: true,
        ),
        ChangeNotifierProvider(
          create: (context) => TabUserProvider(),
          lazy: true,
        ),
        ChangeNotifierProvider(
          create: (context) => CategoryProvider(categoryService: CategoryService()),
          lazy: true,
        ),
        ChangeNotifierProvider(
            create: (context) => ProductProvider(productService: ProductService())
        ),
        ChangeNotifierProvider(
          create: (context) =>
              ProfileProvider(profileService: ProfileService()),
          lazy: true,
        ),
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
      child: SplashScreen(),
    );
  }
}