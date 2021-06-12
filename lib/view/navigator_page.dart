import 'package:flutter/material.dart';

import 'listagem_page.dart';
import 'cadastro_page.dart';
import 'login_page.dart';
import 'relatorio_page.dart';

class NavigatorPage extends StatefulWidget {
  @override
  _NavigatorPageState createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  int _indiceAtual = 1;
  final List<Widget> _telas = [
    CadastroPage(),
    ListagemPage(),
    RelatorioPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _telas[_indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 13,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        selectedFontSize: 17,
        iconSize: 30,
        selectedItemColor: Color.fromRGBO(32, 32, 86, 1.0),
        unselectedItemColor: Colors.white,
        backgroundColor: Color.fromRGBO(203, 79, 36, 1),
        currentIndex: _indiceAtual,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            title: Text(
              "Cadastro",
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list_alt_rounded,
            ),
            title: Text(
              "Lista",
            ),
          ),
          BottomNavigationBarItem(
            title: Text(
              "Relatório",
            ),
            icon: Icon(
              Icons.analytics_outlined,
            ),
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      // if (index == 2) {
      //   Navigator.of(context).pop(
      //     MaterialPageRoute(
      //       builder: (context) => Login_page(),
      //     ),
      //   );
      // }
      _indiceAtual = index;
    });
  }
}
