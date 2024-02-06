import 'package:e_harithasena_app/ui/screens/signinpage/signinpage.dart';
import 'package:flutter/material.dart';

import '../../values/color.dart';
import '../../widgets/authbanner.dart';
import '../../widgets/authfooter.dart';
import '../../widgets/custombutton.dart';


class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
              child: SingleChildScrollView(
                child: SizedBox(
                 
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 15,
                      ),
                      const AuthBanner(
                          imgpath: 'assets/image/signupimage.svg',
                          title: "Create Account",
                         ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 30,
                      ),
                   TextFormField(
                  decoration: const InputDecoration(label: Text("Email",)),
                ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                  decoration: const InputDecoration(label: Text("Password",)),
                ),
                   const SizedBox(
                        height: 10,
                      ),
                  TextFormField(
                  decoration: const InputDecoration(label: Text("Confirm Password",)),
                ),
                   
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 30,
                      ),
                        CustomButton(buttonText: "SignUp", onPressed:(){}, txtcolor: onPrimary),
                 const SizedBox(height: 15,),
      
                      AuthFooter(
                        text: "Already have an account?",
                        buttontext: "Sign in",
                        action: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const SignInPage()));
              },
              
                      )
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}