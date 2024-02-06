import 'package:e_harithasena_app/ui/values/color.dart';
import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final Color  txtcolor;
  final IconData? suffixIcon;
  const CustomButton(
      {super.key,
      required this.buttonText,
      required this.onPressed,
      this.suffixIcon,
      
      required this.txtcolor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 15,
      width: double.maxFinite,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: TextStyle(
              color: txtcolor,
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }
}
