import 'package:e_harithasena_app/ui/screens/homepage/widgets/customcard.dart';
import 'package:e_harithasena_app/ui/screens/signinpage/signinpage.dart';
import 'package:e_harithasena_app/ui/values/color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  static const routename = 'homepage';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () async {
        await FirebaseAuth.instance.signOut();
        Navigator.of(context).pushReplacementNamed(SignInPage.routename);
      }),
      body: Column(
        children: [
          Container(
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(18),
                    bottomRight: Radius.circular(18))),
          )
        ],
      ),
    );
  }
}
