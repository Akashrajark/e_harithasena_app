import 'package:e_harithasena_app/ui/screens/signuppage/signuppage.dart';
import 'package:flutter/material.dart';

import '../../values/color.dart';
import '../../widgets/authbanner.dart';
import '../../widgets/authfooter.dart';
import '../../widgets/custombutton.dart';
import 'widgets/forgotpassword.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool obs = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 15,
                ),
                const AuthBanner(
                  imgpath: 'assets/image/signinimage.svg',
                  title: "Login to continue",
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      label: Text(
                    "Email",
                  )),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration:  InputDecoration(
                      label: Text(
                        "Password",
                      ),
                      suffixIcon: IconButton(
                          onPressed: (){
                            setState(() {
                              obs=!obs;
                            });
                          }, icon: Icon(obs?Icons.visibility:Icons.visibility_off))),
                  obscureText: obs,
                ),
                const SizedBox(
                  height: 10,
                ),
                const ForgetTextButton(),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                ),
                CustomButton(
                    buttonText: "Sign In",
                    onPressed: () {},
                    txtcolor: onPrimary),
               const SizedBox(
                height: 15,
               ),
                AuthFooter(
                  text: "Dont have an account?",
                  buttontext: "Sign up",
                  action: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const SignUpPage()));
                  },
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
