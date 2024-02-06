import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:google_fonts/google_fonts.dart';



class AuthBanner extends StatelessWidget {
  final String imgpath,title;
  const AuthBanner({super.key, required this.imgpath, required this.title,});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Image(
                      image: Svg(imgpath),
                      width: MediaQuery.of(context).size.height / 3,
                      height: MediaQuery.of(context).size.height / 3,
                    ),
                   const SizedBox(
                      height: 15,
                    ),
                    Text(title,
                        style: GoogleFonts.pacifico(textStyle: Theme.of(context).textTheme.headlineMedium!)),
                  
      ],
    );
  }
}