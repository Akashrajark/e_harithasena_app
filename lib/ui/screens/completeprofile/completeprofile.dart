import 'package:e_harithasena_app/ui/widgets/customdropdown.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../values/color.dart';
import '../../widgets/custombutton.dart';

class CompleteProfile extends StatelessWidget {
  const CompleteProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(15.0),
          child: CustomButton(
              buttonText: "Submit", onPressed: () {}, txtcolor: onPrimary),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Complete Profile",
                    style: GoogleFonts.pacifico(
                        textStyle: Theme.of(context).textTheme.headlineMedium!),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        label: Text(
                      "Name",
                    )),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomDropdownButton(
                      labelText: "District",
                      items: const ["Select", "hello", "hi"],
                      value: "Select",
                      onChanged: (val) {}),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomDropdownButton(
                      labelText: "Muncipality/Panchayath",
                      items: const ["Muncipality/Panchayath", "hello", "hi"],
                      value: "Muncipality/Panchayath",
                      onChanged: (val) {}),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomDropdownButton(
                      labelText: "Ward No",
                      items: const ["Ward No", "hello", "hi"],
                      value: "Ward No",
                      onChanged: (val) {}),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        label: Text(
                      "House no",
                    )),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
