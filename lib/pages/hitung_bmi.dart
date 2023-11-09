import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HitungBMI extends StatefulWidget {
  const HitungBMI({super.key});

  @override
  State<HitungBMI> createState() => _HitungBMIState();
}

class _HitungBMIState extends State<HitungBMI> {
  int currentindex = 0;
  String hasil = "";
  TextEditingController tinggiController = TextEditingController();
  TextEditingController beratController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hitung BMI',
          style: GoogleFonts.poppins(),
        ),
        backgroundColor: Color.fromRGBO(83, 33, 43, 1),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Image.asset('assets/bmi.png'),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: tinggiController,
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
                    hintText: 'Masukan Tinggi Badan',
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: beratController,
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
                    hintText: 'Masukan Berat Badan',
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: GestureDetector(
                  onTap: () {
                    double tinggi = double.parse(tinggiController.value.text);
                    double berat = double.parse(beratController.value.text);
                    hitungBmi(tinggi, berat);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(253, 69, 86, 1),
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                          child: Text(
                        'Hitung',
                        style: GoogleFonts.poppins(fontSize: 20),
                      )),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hasil BMI : ',
                    style: GoogleFonts.poppins(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    hasil,
                    style: GoogleFonts.poppins(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void hitungBmi(double tinggi, double berat) {
    double finalhasil = berat / (tinggi * tinggi / 10000);
    String bmi = finalhasil.toStringAsFixed(2);
    setState(() {
      hasil = bmi;
    });
  }
}
