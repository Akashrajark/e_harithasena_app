import 'dart:async';

import 'package:e_harithasena_app/ui/values/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/validators.dart';
import '../../widgets/custombutton.dart';
import 'bloc/resetpassword_bloc.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const routename='resetpage';
  
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  Timer? timer;
  final TextEditingController emailcontroller = TextEditingController();
  final forgetformkey = GlobalKey<FormState>();
  int countdown = 0;

  @override
  void dispose() {
    emailcontroller.dispose();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetpasswordBloc(),
      child: BlocListener<ResetpasswordBloc, ResetpasswordState>(
        listener: (context, state) {
          if (state is ResetLinkSentState) {
            countdown = 30;
            timer = Timer.periodic(const Duration(seconds: 1), (timer) {
              if (countdown > 0) {
                setState(() {
                  countdown--;
                });
              }
            });
          }
          if (state is ResendReadyState) {
            countdown = 30;
            timer!.cancel();
          }
          if (state is ErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.errmsg),
              backgroundColor: Theme.of(context).colorScheme.error,
            ));
          }
        },
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            centerTitle: true,
            backgroundColor: Theme.of(context).primaryColor,
            title: Text(
              "Reset Password",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: forgetformkey,
                  child: TextFormField(
                    validator: emailValidator,
                    controller: emailcontroller,
                    decoration: const InputDecoration(
                        label: Text(
                      "Email",
                    )),
                  ),
                ),
                SizedBox(height: 20,),
                BlocBuilder<ResetpasswordBloc, ResetpasswordState>(
                  builder: (context, state) {
                    return CustomButton(
                       buttonText : state is LoadingState
                            ? "Senting..."
                            : state is ResetLinkSentState
                                ? "Wait $countdown seconds"
                                : state is ResendReadyState
                                    ? "Resend Link"
                                    : "Sent Reset Link",
                        onPressed: state is ResetLinkSentState
                            ? null
                            : () {
                                if (forgetformkey.currentState!.validate()) {
                                  BlocProvider.of<ResetpasswordBloc>(context).add(
                                      SentResetLinkEvent(emailcontroller.text));
                                }
                              },txtcolor: onPrimary,);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
