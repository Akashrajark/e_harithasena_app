import 'package:e_harithasena_app/ui/values/color.dart';
import 'package:flutter/material.dart';

class ForgetTextButton extends StatelessWidget {
  const ForgetTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text("Forgot Password?",style: Theme.of(context).textTheme.labelLarge!.copyWith(color: textColor),),
                  ),
                );
  }
  }