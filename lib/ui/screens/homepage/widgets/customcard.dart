import 'package:e_harithasena_app/ui/values/color.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Card(
        elevation: 4, // Adjust elevation as per your design
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0), // Similar border radius
        ),
        color: primaryColor, // Green color
        child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pickup date",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.bold,
                          color: onPrimary),
                    ),
                    SizedBox(height: 40,),
                    Text("Available?",
                     style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(
                          color: onPrimary),)
                  ],
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right:20.0),
                  child: Column(
                    children: [
                      Text(
                        "6",
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(fontWeight: FontWeight.bold,
                            color: onPrimary),
                      ),
                      Text("FEB",
                       style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(
                            color: onPrimary),)
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
