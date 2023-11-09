import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KonversiWaktu extends StatefulWidget {
  const KonversiWaktu({super.key});

  @override
  State<KonversiWaktu> createState() => _KonversiWaktuState();
}

class _KonversiWaktuState extends State<KonversiWaktu> {
  final List<String> timeUnits = ['Detik', 'Menit', 'Jam'];
  String selectedUnit = 'Detik';
  double inputValue = 0.0;
  List<String> convertedValues = [];

  void convertTime(double input, String selectedUnit) {
    List<String> results = [];

    if (selectedUnit == 'Detik') {
      results.add('${(input / 60).toStringAsFixed(2)} Menit');
      results.add('${(input / 3600).toStringAsFixed(2)} Jam');
    } else if (selectedUnit == 'Menit') {
      results.add('${(input * 60).toStringAsFixed(2)} Detik');
      results.add('${(input / 60).toStringAsFixed(2)} Jam');
    } else if (selectedUnit == 'Jam') {
      results.add('${(input * 3600).toStringAsFixed(2)} Detik');
      results.add('${(input * 60).toStringAsFixed(2)} Menit');
    }

    setState(() {
      convertedValues = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Konversi Waktu',
          style: GoogleFonts.poppins(),
        ),
        backgroundColor: Color.fromRGBO(83, 33, 43, 1),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              TextField(
                onChanged: (value) {
                  setState(() {
                    inputValue = double.tryParse(value) ?? 0.0;
                    convertTime(inputValue, selectedUnit);
                  });
                },
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
                    hintText: 'Masukan Waktu'),
              ),
              SizedBox(
                height: 30,
              ),
              DropdownButton<String>(
                value: selectedUnit,
                onChanged: (String) {
                  setState(() {
                    selectedUnit = String!;
                    convertTime(inputValue, selectedUnit);
                  });
                },
                items: timeUnits.map((String unit) {
                  return DropdownMenuItem<String>(
                    value: unit,
                    child: Text(unit),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              Text(
                'Hasil Konversi : ',
                style: GoogleFonts.poppins(fontSize: 20),
              ),
              SizedBox(height: 20),
              for (String result in convertedValues)
                Text(result, style: GoogleFonts.poppins(fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}
