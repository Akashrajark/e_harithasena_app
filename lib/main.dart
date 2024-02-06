import 'package:e_harithasena_app/ui/screens/completeprofile/completeprofile.dart';
import 'package:e_harithasena_app/ui/screens/homepage/homepage.dart';
import 'package:e_harithasena_app/ui/screens/profilepage/profilepage.dart';
import 'package:e_harithasena_app/ui/screens/signuppage/signuppage.dart';
import 'package:e_harithasena_app/ui/themes/apptheme.dart';

import 'package:flutter/material.dart';

import 'ui/screens/signinpage/signinpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'EHarithaSena',
        theme: appTheme,
        home: const ProfilePage());
  }
}
