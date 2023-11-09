import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GrafikGaris extends StatefulWidget {
  const GrafikGaris({super.key});

  @override
  State<GrafikGaris> createState() => _GrafikGarisState();
}

class _GrafikGarisState extends State<GrafikGaris> {
  late List<ChartData> data;
  late TooltipBehavior _tooltip;
  TextEditingController xController = TextEditingController();
  TextEditingController yController = TextEditingController();

  @override
  void initState() {
    data = [
      ChartData('Jan', 35, Colors.red),
      ChartData('Feb', 28, Colors.green),
      ChartData('Mar', 34, Colors.blue),
      ChartData('Apr', 32, Colors.pink),
      ChartData('May', 40, Colors.black),
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  void updateDataPoint() {
    final String xValue = xController.text;
    final double yValue = double.parse(yController.text);

    if (xValue.isNotEmpty && yValue != null) {
      final int dataIndex = data.indexWhere((element) => element.x == xValue);

      if (dataIndex != -1) {
        setState(() {
          data[dataIndex].y = yValue;
        });
      }
    }
  }

  void addDataPoint() {
    final String xValue = xController.text;
    final double yValue = double.parse(yController.text);

    if (xValue.isNotEmpty && yValue != null) {
      setState(() {
        data.add(ChartData(xValue, yValue, Colors.teal));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Line Chart',
          style: GoogleFonts.poppins(),
        ),
        backgroundColor: Color.fromRGBO(83, 33, 43, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 500,
                height: 200,
                child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  series: <ChartSeries>[
                    LineSeries<ChartData, String>(
                      dataSource: data,
                      pointColorMapper: (ChartData data, _) => data.color,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y,
                    ),
                  ],
                  tooltipBehavior: _tooltip,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: xController,
                decoration: InputDecoration(labelText: 'X Value'),
              ),
              TextField(
                controller: yController,
                decoration: InputDecoration(labelText: 'Y Value'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: updateDataPoint,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(253, 69, 86, 1),
                          borderRadius: BorderRadius.circular(30)),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Center(
                            child: Text(
                          'Update Data Point',
                          style: GoogleFonts.poppins(fontSize: 15),
                        )),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: addDataPoint,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(253, 69, 86, 1),
                          borderRadius: BorderRadius.circular(30)),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Center(
                            child: Text(
                          'Add Data Point',
                          style: GoogleFonts.poppins(fontSize: 15),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  double y;
  final Color color;
}
