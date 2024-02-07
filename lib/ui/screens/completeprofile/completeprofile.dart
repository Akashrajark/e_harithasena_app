import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_harithasena_app/ui/screens/homepage/homepage.dart';
import 'package:e_harithasena_app/ui/widgets/customdropdown.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/usermodel.dart';
import '../../values/color.dart';
import '../../widgets/custombutton.dart';

class CompleteProfile extends StatefulWidget {
  static const routename = 'completeprofile';
  const CompleteProfile({super.key});

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  final namecontroller = TextEditingController();
  final hncontroller = TextEditingController();
  String? district, morp, wardno;

  bool checkComp() {
    if (district != null &&
        wardno != null &&
        morp != null &&
        namecontroller.text.isNotEmpty &&
        hncontroller.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(15.0),
          child: CustomButton(
              buttonText: "Submit",
              onPressed: () async {
                try {
                  UserModel userinfo = UserModel(
                      userid: FirebaseAuth.instance.currentUser?.uid,
                      name: namecontroller.text.trim(),
                      district: district,
                      houseno: int.parse(hncontroller.text),
                      iscomp: checkComp(),
                      morp: morp,
                      wardno: wardno);
                  await FirebaseFirestore.instance
                      .collection("users")
                      .doc(FirebaseAuth.instance.currentUser?.uid)
                      .set(
                        userinfo.toMap(),
                      );
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      HomePage.routename, (route) => false);
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        e.toString(),
                      ),
                    ),
                  );
                }
              },
              txtcolor: onPrimary),
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
                    controller: namecontroller,
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
                      items: const ["District", "Kannur", "Kozhikode"],
                      value: "District",
                      onChanged: (val) {district=val;}),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomDropdownButton(
                      labelText: "Muncipality/Panchayath",
                      items: const ["Muncipality/Panchayath", "Kalliasseri", "Pappinisseri"],
                      value: "Muncipality/Panchayath",
                      onChanged: (val) {morp=val;}),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomDropdownButton(
                      labelText: "Ward No",
                      items: const ["Ward No", "34", "26"],
                      value: "Ward No",
                      onChanged: (val) {wardno=val;}),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: namecontroller,
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
