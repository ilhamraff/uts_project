import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KonversiMataUang extends StatefulWidget {
  const KonversiMataUang({super.key});

  @override
  State<KonversiMataUang> createState() => _KonversiMataUangState();
}

class _KonversiMataUangState extends State<KonversiMataUang> {
  double rupiahAmount = 0;
  Map<String, double> exchangeRates = {
    'USD': 15000, // Kurs USD ke IDR
    'EUR': 17000, // Kurs EUR ke IDR
    'KRW': 13, // Kurs KRW ke IDR
  };

  Map<String, double> convertedAmounts = {};

  void setConversionRates() {
    convertedAmounts.clear();
    exchangeRates.forEach((currency, rate) {
      double convertedAmount = rupiahAmount / rate;
      convertedAmounts[currency] = convertedAmount;
    });

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Konversi Mata Uang',
          style: GoogleFonts.poppins(),
        ),
        backgroundColor: Color.fromRGBO(83, 33, 43, 1),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Text('Kurs saat ini: 1 USD = 15,000 IDR'),
            Text('Kurs saat ini: 1 EUR = 17,000 IDR'),
            Text('Kurs saat ini: 1 KRW = 13 IDR'),
            SizedBox(
              height: 30,
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
                  hintText: 'Masukan Jumlah Rupiah'),
              onChanged: (value) {
                rupiahAmount = double.tryParse(value) ?? 0;
              },
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: setConversionRates,
              child: Container(
                width: 250,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(253, 69, 86, 1),
                    borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                      child: Text(
                    'Konversi Nilai Rupiah',
                    style: GoogleFonts.poppins(fontSize: 18),
                  )),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              children: convertedAmounts.keys.map((String currency) {
                return Text(
                  '${convertedAmounts[currency]?.toStringAsFixed(2)} $currency',
                  style: GoogleFonts.poppins(fontSize: 20),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
