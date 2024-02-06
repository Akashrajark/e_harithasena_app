import 'package:flutter/material.dart';

import '../values/color.dart';

ThemeData appTheme = ThemeData(
  
          colorScheme:const ColorScheme.light().copyWith(
            primary: primaryColor,
            onPrimary: onPrimary,
          ),
          inputDecorationTheme: InputDecorationTheme(
            labelStyle: const TextStyle(color: textColor),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(color: Colors.green),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide:const BorderSide(color: Colors.grey),
            ),
          ),
          useMaterial3: true,
        );