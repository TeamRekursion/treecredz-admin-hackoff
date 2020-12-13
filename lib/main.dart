import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treecredz_admin/presentation/screens/landing/auth_screen.dart';
import 'package:treecredz_admin/presentation/screens/main/container_screen.dart';
import 'package:treecredz_admin/presentation/themes/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'TreeCredz Admin',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: (FirebaseAuth.instance.currentUser != null)
          ? ContainerScreen()
          : AuthScreen(),
    );
  }
}
