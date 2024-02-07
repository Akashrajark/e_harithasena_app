import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../values/color.dart';
import '../../widgets/custombutton.dart';
import '../../widgets/customdropdown.dart';

class ProfilePage extends StatefulWidget {
  static const routename='profilepage';
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool edit=false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          bottomNavigationBar:  Padding(
          padding: const EdgeInsets.all(15.0),
          child: CustomButton(
              buttonText: edit?"Save":"Edit Profile", onPressed: () {setState(() {
                edit=!edit;
              });}, txtcolor: onPrimary),
        ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Text(
                "Profile",
                style: GoogleFonts.pacifico(
                    textStyle: Theme.of(context).textTheme.headlineMedium!),
              ),
            
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                enabled: edit,
                decoration:  InputDecoration(
                   labelStyle: Theme.of(context).inputDecorationTheme.labelStyle!.copyWith(color: Colors.grey),
                    label:const Text(
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
                  onChanged: edit?(val) {}:null),
              const SizedBox(
                height: 15,
              ),
              CustomDropdownButton(
                  labelText: "Muncipality/Panchayath",
                  items: const ["Muncipality/Panchayath", "hello", "hi"],
                  value: "Muncipality/Panchayath",
                  onChanged:  edit?(val) {}:null),
              const SizedBox(
                height: 10,
              ),
              CustomDropdownButton(
                  labelText: "Ward No",
                  items: const ["Ward No", "hello", "hi"],
                  value: "Ward No",
                  onChanged: edit?(val) {}:null),
                  
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration:  InputDecoration(
                  labelStyle: Theme.of(context).inputDecorationTheme.labelStyle!.copyWith(color: Colors.grey),
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
    ));
  }
}
