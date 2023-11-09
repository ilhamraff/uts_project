import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GrafikBar extends StatefulWidget {
  const GrafikBar({super.key});

  @override
  State<GrafikBar> createState() => _GrafikBarState();
}

class _GrafikBarState extends State<GrafikBar> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;
  TextEditingController xController = TextEditingController();
  TextEditingController yController = TextEditingController();

  @override
  void initState() {
    data = [
      _ChartData('CHN', 12),
      _ChartData('GER', 15),
      _ChartData('RUS', 30),
      _ChartData('BRZ', 6.4),
      _ChartData('IND', 14),
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  void addDataPoint() {
    final String xValue = xController.text;
    final double yValue = double.parse(yController.text);

    if (xValue.isNotEmpty && yValue != null) {
      setState(() {
        data.add(_ChartData(xValue, yValue));
      });
    }
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

  void removeDataPoint(int index) {
    setState(() {
      data.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bar Chart',
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
                  primaryYAxis:
                      NumericAxis(minimum: 0, maximum: 40, interval: 10),
                  tooltipBehavior: _tooltip,
                  series: <ChartSeries<_ChartData, String>>[
                    BarSeries<_ChartData, String>(
                      dataSource: data,
                      xValueMapper: (_ChartData data, _) => data.x,
                      yValueMapper: (_ChartData data, _) => data.y,
                      name: 'Gold',
                      color: Color.fromRGBO(253, 69, 86, 1),
                    ),
                  ],
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
              SizedBox(height: 20),

              // if (data.isNotEmpty)
              //   Column(
              //     children: [
              //       Text('Data Points:'),
              //       for (int i = 0; i < data.length; i++)
              //         ListTile(
              //           title: Text('X: ${data[i].x}, Y: ${data[i].y}'),
              //           trailing: IconButton(
              //             icon: Icon(Icons.delete),
              //             onPressed: () => removeDataPoint(i),
              //           ),
              //         ),
              //     ],
              //   ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  double y;
}
