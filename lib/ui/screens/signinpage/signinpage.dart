import 'package:e_harithasena_app/ui/screens/completeprofile/completeprofile.dart';
import 'package:e_harithasena_app/ui/screens/homepage/homepage.dart';
import 'package:e_harithasena_app/ui/screens/resetpasswordscreen/resetpasswordscreen.dart';
import 'package:e_harithasena_app/ui/screens/signuppage/signuppage.dart';
import 'package:e_harithasena_app/utils/validators.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/auth_bloc/auth_bloc.dart';
import '../../values/color.dart';
import '../../widgets/authbanner.dart';
import '../../widgets/authfooter.dart';
import '../../widgets/custombutton.dart';
import 'widgets/forgotpassword.dart';

class SignInPage extends StatefulWidget {
  static const routename = 'signinpage';
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  bool obs = true;
  final signinformkey = GlobalKey<FormState>();

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (FirebaseAuth.instance.currentUser != null) {
        Navigator.popUntil(context, (route) => route.isFirst);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is SignUpState) {
            Navigator.popUntil(context, (route) => route.isFirst);
            Navigator.pushReplacementNamed(context, SignUpPage.routename);
          } else if (state is ProfileIncompleteState) {
            Navigator.popUntil(context, (route) => route.isFirst);
            Navigator.pushReplacementNamed(context, CompleteProfile.routename);
          } else if (state is AuthSuccessState) {
            Navigator.popUntil(context, (route) => route.isFirst);
            Navigator.pushReplacementNamed(context, HomePage.routename);
          } else if (state is ErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Theme.of(context).colorScheme.error,
                content: Text(state.errmsg),
              ),
            );
          }
        },
        builder: (context, state) {
          return Form(
            key: signinformkey,
            child: SafeArea(
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
                          validator: emailValidator,
                          controller: emailcontroller,
                          decoration: const InputDecoration(
                              label: Text(
                            "Email",
                          )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          validator: passwordValidator,
                          controller: passwordcontroller,
                          decoration: InputDecoration(
                              label: Text(
                                "Password",
                              ),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      obs = !obs;
                                    });
                                  },
                                  icon: Icon(obs
                                      ? Icons.visibility
                                      : Icons.visibility_off))),
                          obscureText: obs,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ForgetTextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, ResetPasswordScreen.routename);
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 30,
                        ),
                        CustomButton(
                            buttonText: "Sign In",
                            onPressed: () {
                              if (signinformkey.currentState!.validate()) {
                                BlocProvider.of<AuthBloc>(context).add(
                                    LoginRequestEvent(
                                        email: emailcontroller.text.trim(),
                                        password:
                                            passwordcontroller.text.trim()));
                              }
                            },
                            txtcolor: onPrimary),
                        const SizedBox(
                          height: 15,
                        ),
                        AuthFooter(
                          text: "Dont have an account?",
                          buttontext: "Sign up",
                          action: () {
                            BlocProvider.of<AuthBloc>(context)
                                .add(SignUpToggleEvent());
                          },
                        )
                      ],
                    ),
                  ),
                ),
              )),
            ),
          );
        },
      ),
    );
  }
}
