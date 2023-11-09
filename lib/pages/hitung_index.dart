import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IndexNilai extends StatefulWidget {
  const IndexNilai({super.key});

  @override
  State<IndexNilai> createState() => _IndexNilaiState();
}

class _IndexNilaiState extends State<IndexNilai> {
  double uts = 0;
  double uas = 0;
  double tugas1 = 0;
  double tugas2 = 0;

  double nilaiAkhir = 0;
  String indeksNilai = "";
  double ipk = 0;

  void calculateNilai() {
    // Hitung nilai akhir berdasarkan bobot
    nilaiAkhir = (uts * 0.3) + (uas * 0.4) + (tugas1 * 0.15) + (tugas2 * 0.15);

    // Tentukan indeks nilai berdasarkan kisaran nilai
    if (nilaiAkhir >= 80) {
      indeksNilai = "A";
    } else if (nilaiAkhir >= 75) {
      indeksNilai = "AB";
    } else if (nilaiAkhir >= 70) {
      indeksNilai = "B";
    } else if (nilaiAkhir >= 65) {
      indeksNilai = "BC";
    } else if (nilaiAkhir >= 60) {
      indeksNilai = "C";
    } else if (nilaiAkhir >= 50) {
      indeksNilai = "CD";
    } else {
      indeksNilai = "D";
    }

    // Hitung IPK dengan rata-rata nilai indeks yang diperoleh
    ipk = (nilaiAkhir / 100) * 4;

    setState(() {
      // Kode ini akan memicu tampilan diperbarui dengan nilai akhir, indeks nilai, dan IPK yang dihitung.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hitung Index Nilai',
          style: GoogleFonts.poppins(),
        ),
        backgroundColor: Color.fromRGBO(83, 33, 43, 1),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('UAS : 40%'),
                  Text('UTS : 30%'),
                  Text('Tugas1 : 15%'),
                  Text('Tugas2 : 15%'),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                keyboardType: TextInputType.number,
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
                    hintText: 'Nilai UTS'),
                onChanged: (value) {
                  uts = double.tryParse(value) ?? 0;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                keyboardType: TextInputType.number,
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
                    hintText: 'Nilai UAS'),
                onChanged: (value) {
                  uas = double.tryParse(value) ?? 0;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                keyboardType: TextInputType.number,
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
                    hintText: 'Nilai Tugas 1'),
                onChanged: (value) {
                  tugas1 = double.tryParse(value) ?? 0;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                keyboardType: TextInputType.number,
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
                    hintText: 'Nilai Tugas 2'),
                onChanged: (value) {
                  tugas2 = double.tryParse(value) ?? 0;
                },
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: calculateNilai,
                child: Container(
                  width: 200,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(253, 69, 86, 1),
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                        child: Text(
                      'Hitung Nilai Akhir',
                      style: GoogleFonts.poppins(fontSize: 18),
                    )),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Nilai Akhir: ${nilaiAkhir.toStringAsFixed(2)}',
                style: GoogleFonts.poppins(fontSize: 20),
              ),
              Text('Indeks Nilai: $indeksNilai',
                  style: GoogleFonts.poppins(fontSize: 20)),
              Text('IP: ${ipk.toStringAsFixed(2)}',
                  style: GoogleFonts.poppins(fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}
