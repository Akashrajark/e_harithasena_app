import 'package:e_harithasena_app/ui/screens/homepage/widgets/customcard.dart';
import 'package:e_harithasena_app/ui/screens/signinpage/signinpage.dart';
import 'package:e_harithasena_app/ui/values/color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  static const routename = 'homepage';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool home = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        automaticallyImplyLeading: true,
        backgroundColor: primaryColor,
        centerTitle: true,
        title:  Text(
          "E-harithaseva",
          style: GoogleFonts.pacifico(textStyle: TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),)
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        await FirebaseAuth.instance.signOut();
        Navigator.of(context).pushReplacementNamed(SignInPage.routename);
      }),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Stack(children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    stops: [0.75, 0.75],
                    colors: [primaryColor, Colors.green[900]!],
                  ),
                ),
                height: 200,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Next Pickup Date",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: onPrimary),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "6 FEB",
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                  color: onPrimary,
                                  fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Text(
                              home ? "IM HOME" : "NOT HOME",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(color: onPrimary),
                            ),
                            SizedBox(width: 20,),
                            Switch(
                              value: home,
                              onChanged: (value) {
                                setState(() {
                                  home = !home;
                                });
                              },
                              activeTrackColor: Colors.white,
                              activeColor: Colors.green[700],
                            )
                          ],
                        ),
                      ]),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                    height: 200,
                    width: 200,
                    child: Image.asset(
                      'assets/image/bin.png',
                    )),
              )
            ])
          ],
        ),
      ),
    );
  }
}
