import 'package:e_harithasena_app/ui/screens/homepage/widgets/customcard.dart';
import 'package:e_harithasena_app/ui/screens/signinpage/signinpage.dart';
import 'package:e_harithasena_app/ui/values/color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  static const routename = 'homepage';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool home = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: primaryColor,
          centerTitle: true,
          title: Text("E-harithaseva",
              style: GoogleFonts.pacifico(
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
              )),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.logout),
            backgroundColor: primaryColor,
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushReplacementNamed(SignInPage.routename);
            }),
        body: Padding(
            padding: const EdgeInsets.all(15.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Stack(children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      stops: [0.75, 0.75],
                      colors: [primaryColor, Colors.green[900]!],
                    ),
                  ),
                  height: 200,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Next Pickup Date",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: onPrimary),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "6 FEB",
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                  color: onPrimary,
                                  fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Text(
                              home ? "IM HOME" : "NOT HOME",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(color: onPrimary),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Switch(
                              value: home,
                              onChanged: (value) {
                                setState(() {
                                  home = !home;
                                });
                              },
                              activeTrackColor: Colors.white,
                              activeColor: Colors.green[700],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                      height: 200,
                      width: 200,
                      child: Image.asset(
                        'assets/image/bin.png',
                      )),
                )
              ]),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  "History",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              DataTable(
                columns: const <DataColumn>[
                  DataColumn(
                    label: Text(
                      'Date',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18), // Adjust the font size here
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Weight',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18), // Adjust the font size here
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Amount',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18), // Adjust the font size here
                    ),
                  ),
                ],
                rows: const <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text(
                        '2024-02-01',
                        style: TextStyle(
                            fontSize: 16), // Adjust the font size here
                      )),
                      DataCell(Text(
                        '150',
                        style: TextStyle(
                            fontSize: 16), // Adjust the font size here
                      )),
                      DataCell(Text(
                        '200',
                        style: TextStyle(
                            fontSize: 16), // Adjust the font size here
                      )),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text(
                        '2024-02-02',
                        style: TextStyle(
                            fontSize: 16), // Adjust the font size here
                      )),
                      DataCell(Text(
                        '155',
                        style: TextStyle(
                            fontSize: 16), // Adjust the font size here
                      )),
                      DataCell(Text(
                        '210',
                        style: TextStyle(
                            fontSize: 16), // Adjust the font size here
                      )),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text(
                        '2024-02-03',
                        style: TextStyle(
                            fontSize: 16), // Adjust the font size here
                      )),
                      DataCell(Text(
                        '152',
                        style: TextStyle(
                            fontSize: 16), // Adjust the font size here
                      )),
                      DataCell(Text(
                        '195',
                        style: TextStyle(
                            fontSize: 16), // Adjust the font size here
                      )),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text(
                        '2024-02-03',
                        style: TextStyle(
                            fontSize: 16), // Adjust the font size here
                      )),
                      DataCell(Text(
                        '152',
                        style: TextStyle(
                            fontSize: 16), // Adjust the font size here
                      )),
                      DataCell(Text(
                        '195',
                        style: TextStyle(
                            fontSize: 16), // Adjust the font size here
                      )),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text(
                        '2024-02-03',
                        style: TextStyle(
                            fontSize: 16), // Adjust the font size here
                      )),
                      DataCell(Text(
                        '152',
                        style: TextStyle(
                            fontSize: 16), // Adjust the font size here
                      )),
                      DataCell(Text(
                        '195',
                        style: TextStyle(
                            fontSize: 16), // Adjust the font size here
                      )),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text(
                        '2024-02-03',
                        style: TextStyle(
                            fontSize: 16), // Adjust the font size here
                      )),
                      DataCell(Text(
                        '152',
                        style: TextStyle(
                            fontSize: 16), // Adjust the font size here
                      )),
                      DataCell(Text(
                        '195',
                        style: TextStyle(
                            fontSize: 16), // Adjust the font size here
                      )),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text(
                        '2024-02-03',
                        style: TextStyle(
                            fontSize: 16), // Adjust the font size here
                      )),
                      DataCell(Text(
                        '152',
                        style: TextStyle(
                            fontSize: 16), // Adjust the font size here
                      )),
                      DataCell(Text(
                        '195',
                        style: TextStyle(
                            fontSize: 16), // Adjust the font size here
                      )),
                    ],
                  ),
                  // Add more rows with dummy values as needed
                ],
              ),
            ])));
  }
}
