import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class kalkulatorPage extends StatefulWidget {
  const kalkulatorPage({super.key});

  @override
  State<kalkulatorPage> createState() => _kalkulatorPageState();
}

class _kalkulatorPageState extends State<kalkulatorPage> {
  final ControllerA = TextEditingController();
  final ControllerB = TextEditingController();
  final ControllerHasil = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculator Page',
          style: GoogleFonts.poppins(),
        ),
        backgroundColor: Color.fromRGBO(83, 33, 43, 1),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: ControllerA,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(253, 69, 86, 1)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(253, 69, 86, 1)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    contentPadding: EdgeInsets.all(16),
                    hintText: 'Bilangan Pertama'),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: ControllerB,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(253, 69, 86, 1)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(253, 69, 86, 1)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    contentPadding: EdgeInsets.all(16),
                    hintText: 'Bilangan Kedua'),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      String a = ControllerA.text;
                      String b = ControllerB.text;
                      double dA = double.parse(a);
                      double dB = double.parse(b);
                      double hasil = dA + dB;
                      ControllerHasil.text = hasil.toString();
                    },
                    child: Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(253, 69, 86, 1),
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(
                          child: Text(
                            'Tambah',
                            style: GoogleFonts.poppins(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 30),
                  GestureDetector(
                    onTap: () {
                      String a = ControllerA.text;
                      String b = ControllerB.text;
                      double dA = double.parse(a);
                      double dB = double.parse(b);
                      double hasil = dA - dB;
                      ControllerHasil.text = hasil.toString();
                    },
                    child: Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(253, 69, 86, 1),
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(
                          child: Text(
                            'Kurang',
                            style: GoogleFonts.poppins(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      String a = ControllerA.text;
                      String b = ControllerB.text;
                      double dA = double.parse(a);
                      double dB = double.parse(b);
                      double hasil = dA * dB;
                      ControllerHasil.text = hasil.toString();
                    },
                    child: Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(253, 69, 86, 1),
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(
                          child: Text(
                            'Kali',
                            style: GoogleFonts.poppins(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 30),
                  GestureDetector(
                    onTap: () {
                      String a = ControllerA.text;
                      String b = ControllerB.text;
                      double dA = double.parse(a);
                      double dB = double.parse(b);
                      double hasil = dA / dB;
                      ControllerHasil.text = hasil.toString();
                    },
                    child: Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(253, 69, 86, 1),
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(
                          child: Text(
                            'Bagi',
                            style: GoogleFonts.poppins(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: ControllerHasil,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(253, 69, 86, 1)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(253, 69, 86, 1)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    contentPadding: EdgeInsets.all(16),
                    hintText: 'Hasil'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
