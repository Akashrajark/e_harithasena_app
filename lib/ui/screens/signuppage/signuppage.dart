import 'package:e_harithasena_app/ui/screens/completeprofile/completeprofile.dart';
import 'package:e_harithasena_app/ui/screens/homepage/homepage.dart';
import 'package:e_harithasena_app/ui/screens/signinpage/signinpage.dart';
import 'package:e_harithasena_app/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/auth_bloc/auth_bloc.dart';
import '../../values/color.dart';
import '../../widgets/authbanner.dart';
import '../../widgets/authfooter.dart';
import '../../widgets/custombutton.dart';


class SignUpPage extends StatefulWidget {
  static const routename='signuppage';
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
   final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController cpasswordcontroller = TextEditingController();

bool obs = true;

  final signupformkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>AuthBloc(),
    child: BlocConsumer<AuthBloc,AuthState>(
      listener: (context, state) {

         if (state is LoginState) {
            Navigator.pushReplacementNamed(context, SignInPage.routename);
          } else if (state is AuthSuccessState) {
            Navigator.popUntil(context, (route) => route.isFirst);
            Navigator.pushReplacementNamed(context,
            HomePage.routename
            );
          } else if (state is ProfileIncompleteState) {
            Navigator.popUntil(context, (route) => route.isFirst);
            Navigator.pushReplacementNamed(context, CompleteProfile.routename);
          }else if (state is ErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Theme.of(context).colorScheme.error,
                content: Text(state.errmsg),
              ),
            );
          }
      },
      builder: (context,state){
        return  SafeArea(
      child: Scaffold(
          
          body: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: signupformkey,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
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
                      validator: emailValidator,
                      controller: emailcontroller,
                    decoration: const InputDecoration(label: Text("Email",)),
                  ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          validator: passwordValidator,
                          controller: passwordcontroller,
                    decoration:  InputDecoration(label: Text("Password",),
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
                    TextFormField(
                      validator:(value) {
                        if (value!.isEmpty ||
                            cpasswordcontroller.text !=
                                passwordcontroller.text.trim()) {
                          return "Passwords doesent Match";
                        }
                        return null;
                      } ,
                      controller: cpasswordcontroller,
                    decoration:  InputDecoration(label: Text("Confirm Password",),
                     suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      obs = !obs;
                                    });
                                  },
                                  icon: Icon(obs
                                      ? Icons.visibility
                                      : Icons.visibility_off))),
                          obscureText: obs,),
                  
                     
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 30,
                        ),
                          CustomButton(buttonText: "SignUp", onPressed:(){
                              if (signupformkey.currentState!.validate()) {
                          BlocProvider.of<AuthBloc>(context).add(
                            SignUpRequestEvent(
                              email: emailcontroller.text,
                              password: passwordcontroller.text,
                            ),
                          );
                        }

                          }, txtcolor: onPrimary),
                   const SizedBox(height: 15,),
                  
                        AuthFooter(
                          text: "Already have an account?",
                          buttontext: "Sign in",
                          action: () {
                   BlocProvider.of<AuthBloc>(context)
                            .add(LoginToggleEvent());
                },
                
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
      },
    ),
    );
  }
}