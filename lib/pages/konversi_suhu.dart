import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KonversiSuhu extends StatefulWidget {
  const KonversiSuhu({super.key});

  @override
  State<KonversiSuhu> createState() => _KonversiSuhuState();
}

class _KonversiSuhuState extends State<KonversiSuhu> {
  final List<String> suhuUnits = ['Celcius', 'Fahrenheit', 'Kelvin', 'Reamur'];
  String selectedSuhuUnit = 'Celcius';
  TextEditingController inputController = TextEditingController();
  List<String> results = [];

  void convertSuhu() {
    double inputSuhu = double.tryParse(inputController.text) ?? 0;
    List<String> convertedResults = [];

    if (selectedSuhuUnit == 'Celcius') {
      convertedResults.add('${inputSuhu.toStringAsFixed(2)} Celcius');
      convertedResults
          .add('${(inputSuhu * 9 / 5 + 32).toStringAsFixed(2)} Fahrenheit');
      convertedResults.add('${(inputSuhu + 273.15).toStringAsFixed(2)} Kelvin');
      convertedResults.add('${(inputSuhu * 4 / 5).toStringAsFixed(2)} Reamur');
    } else if (selectedSuhuUnit == 'Fahrenheit') {
      convertedResults
          .add('${((inputSuhu - 32) * 5 / 9).toStringAsFixed(2)} Celcius');
      convertedResults.add('${inputSuhu.toStringAsFixed(2)} Fahrenheit');
      convertedResults.add(
          '${(((inputSuhu - 32) * 5 / 9) + 273.15).toStringAsFixed(2)} Kelvin');
      convertedResults
          .add('${((inputSuhu - 32) * 4 / 9).toStringAsFixed(2)} Reamur');
    } else if (selectedSuhuUnit == 'Kelvin') {
      convertedResults
          .add('${(inputSuhu - 273.15).toStringAsFixed(2)} Celcius');
      convertedResults.add(
          '${((inputSuhu - 273.15) * 9 / 5 + 32).toStringAsFixed(2)} Fahrenheit');
      convertedResults.add('${inputSuhu.toStringAsFixed(2)} Kelvin');
      convertedResults
          .add('${((inputSuhu - 273.15) * 4 / 5).toStringAsFixed(2)} Reamur');
    } else if (selectedSuhuUnit == 'Reamur') {
      convertedResults.add('${(inputSuhu * 5 / 4).toStringAsFixed(2)} Celcius');
      convertedResults
          .add('${((inputSuhu * 9 / 4) + 32).toStringAsFixed(2)} Fahrenheit');
      convertedResults
          .add('${(inputSuhu * 5 / 4 + 273.15).toStringAsFixed(2)} Kelvin');
      convertedResults.add('${inputSuhu.toStringAsFixed(2)} Reamur');
    }

    setState(() {
      results = convertedResults;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Konversi Suhu',
          style: GoogleFonts.poppins(),
        ),
        backgroundColor: Color.fromRGBO(83, 33, 43, 1),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: inputController,
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
                    hintText: 'Masukan Suhu'),
              ),
              SizedBox(
                height: 30,
              ),
              DropdownButton<String>(
                value: selectedSuhuUnit,
                onChanged: (String) {
                  setState(() {
                    selectedSuhuUnit = String!;
                  });
                },
                items: suhuUnits.map((String unit) {
                  return DropdownMenuItem<String>(
                    value: unit,
                    child: Text(unit),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: GestureDetector(
                  onTap: convertSuhu,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(253, 69, 86, 1),
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                          child: Text(
                        'Konversi',
                        style: GoogleFonts.poppins(fontSize: 20),
                      )),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              if (results.isNotEmpty)
                Column(
                  children: results.map((result) {
                    return Text(
                      result,
                      style: GoogleFonts.poppins(fontSize: 18),
                    );
                  }).toList(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
