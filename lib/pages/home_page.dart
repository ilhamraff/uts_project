import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" H O M E "),
        backgroundColor: Color.fromRGBO(83, 33, 43, 1),
      ),
      drawer: Drawer(
        child: Container(
          child: ListView(
            children: [
              DrawerHeader(
                  child: Center(
                child: Text(
                  'Y O U R  G A M E',
                  style: GoogleFonts.bebasNeue(fontSize: 35),
                ),
              )),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text(
                  'Logout',
                  style: GoogleFonts.montserrat(fontSize: 20),
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return LogoutConfirmationDialog();
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Discover',
                          style: GoogleFonts.poppins(
                              fontSize: 30, fontWeight: FontWeight.w700)),
                      Icon(
                        Icons.search,
                        size: 30,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(20.0), //add border radius
                          child: Image.asset(
                            "assets/liquid.jpeg",
                            height: 150.0,
                            width: 150.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(20.0), //add border radius
                          child: Image.asset(
                            "assets/fnatic.jpg",
                            height: 150.0,
                            width: 150.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(20.0), //add border radius
                          child: Image.asset(
                            "assets/navi.png",
                            height: 150.0,
                            width: 150.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(20.0), //add border radius
                          child: Image.asset(
                            "assets/sentinels.jpg",
                            height: 150.0,
                            width: 150.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(20.0), //add border radius
                          child: Image.asset(
                            "assets/cloud9.jpg",
                            height: 150.0,
                            width: 150.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Featured News',
                          style: GoogleFonts.poppins(
                              fontSize: 25, fontWeight: FontWeight.w700)),
                      TextButton(
                          style: TextButton.styleFrom(
                              textStyle: TextStyle(fontSize: 15)),
                          onPressed: () {},
                          child: Text('View All'))
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(10.0), //add border radius
                    child: Image.asset(
                      "assets/vct2024.jpg",
                      height: 200.0,
                      width: 500.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(10.0), //add border radius
                    child: Image.asset(
                      "assets/vct2024sch.jpg",
                      height: 200.0,
                      width: 500.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(10.0), //add border radius
                    child: Image.asset(
                      "assets/vctmadrid.jpg",
                      height: 200.0,
                      width: 500.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(10.0), //add border radius
                    child: Image.asset(
                      "assets/vctshanghai.jpg",
                      height: 200.0,
                      width: 500.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 500,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(253, 69, 86, 1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Image.asset('assets/icons-valorant.png'),
                  ),
                  SizedBox(
                    height: 30,
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
