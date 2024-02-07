import 'package:e_harithasena_app/ui/screens/completeprofile/completeprofile.dart';
import 'package:e_harithasena_app/ui/screens/homepage/homepage.dart';
import 'package:e_harithasena_app/ui/screens/profilepage/profilepage.dart';
import 'package:e_harithasena_app/ui/screens/resetpasswordscreen/resetpasswordscreen.dart';
import 'package:e_harithasena_app/ui/screens/signuppage/signuppage.dart';
import 'package:e_harithasena_app/ui/themes/apptheme.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'ui/screens/signinpage/signinpage.dart';

Future<void> main() async {
WidgetsFlutterBinding.ensureInitialized();

await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);


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
        home: const SignInPage()
        ,
routes: {
  SignInPage.routename:(context) => const SignInPage(),
  SignUpPage.routename:(context) =>const SignUpPage(),
  ProfilePage.routename:(context) =>const ProfilePage(),
  CompleteProfile.routename:(context) =>const CompleteProfile(),
  ResetPasswordScreen.routename:(context) =>const ResetPasswordScreen(),
  HomePage.routename:(context) =>const HomePage(),
  
},
        
        );

        
  }
}
