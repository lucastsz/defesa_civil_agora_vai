/// Donut chart with labels example. This is a simple pie chart with a hole in
/// the middle.
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:charts_flutter/flutter.dart';
import 'package:defesa_civil_agora_vai/view/login_page.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class RelatorioPage extends StatefulWidget {
  @override
  _RelatorioPageState createState() => _RelatorioPageState();
}

class _RelatorioPageState extends State<RelatorioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ui.Color.fromRGBO(203, 79, 36, 1),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop(
                  MaterialPageRoute(
                    builder: (context) => Login_page(),
                  ),
                );
              },
              icon: const Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
            ),
          )
        ],
        title: Text(
          "DEFESA CIVIL ARACAJU",
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 7.0,
                        offset: Offset(8.0, 8.0))
                  ]),
              width: MediaQuery.of(context).size.width * 0.9,
              height: 300,
              child: Stack(
                children: [
                  Container(
                    width: 220,
                    height: 220,
                    child: new charts.PieChart(_createGraph(8, 2, 6),
                        animationDuration: Duration(seconds: 3),
                        animate: false,
                        defaultRenderer: charts.ArcRendererConfig(
                            arcWidth: 50,
                            arcRendererDecorators: [
                              charts.ArcLabelDecorator(
                                  insideLabelStyleSpec: charts.TextStyleSpec(
                                      fontSize: 20, color: charts.Color.white))
                            ])),
                  ),
                  Positioned(
                      bottom: 20,
                      right: 20,
                      child: Container(
                        width: 130,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 7.0,
                                  offset: Offset(8.0, 8.0))
                            ]),
                        child: Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                        color:
                                            ui.Color.fromRGBO(88, 178, 246, 1),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                  ),
                                  Text("Vistoriadas")
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                        color:
                                            ui.Color.fromRGBO(88, 178, 246, 1),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                  ),
                                  Text("Anônimos")
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                        color:
                                            ui.Color.fromRGBO(27, 151, 243, 1),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                  ),
                                  Text("Cadastradas")
                                ],
                              ),
                            ],
                          ),
                        ),
                      ))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 25, left: 20, right: 20),
              child: Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width * 0.42,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.blue[100], width: 3)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Falta Vistoriar",
                          // style: TextStyle(fontSize: 25, color: Colors.black),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "11",
                        )
                        // style: TextStyle(fontSize: 18, color: Colors.black))
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width * 0.42,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.blue[100], width: 3)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Vistoriadas",
                          // style: TextStyle(fontSize: 25, color: Colors.black),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "15",
                        )
                        // style: TextStyle(fontSize: 18, color: Colors.black))
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<Series<LinearSales, String>> _createGraph(
    int vistoriados, int anonimos, int cadastradas) {
  final data = [
    LinearSales('cadastradas', cadastradas),
    LinearSales(
      'vistoriados',
      vistoriados,
    ),
    LinearSales(
      'anônimos',
      anonimos,
    ),
  ];

  return [
    Series<LinearSales, String>(
      id: 'Sales',
      domainFn: (LinearSales sales, _) => sales.indicador,
      measureFn: (LinearSales sales, _) => sales.quantidade,
      data: data,
      labelAccessorFn: (LinearSales row, _) => '${row.quantidade}',
    )
  ];
}

/// Sample linear data type.
class LinearSales {
  final String indicador;
  final int quantidade;

  LinearSales(this.indicador, this.quantidade);
}
