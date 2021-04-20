// import 'package:defesa_civil_protocolo_app/pages/consultar_protocolo.dart';
// import 'package:defesa_civil_protocolo_app/pages/login_page.dart';
import 'package:flutter/material.dart';

import 'consultar_protocolo.dart';
import 'login_page.dart';

class Editar_Page extends StatelessWidget {
  double sizeTextHeaderSet(context) {
    double unitHeightValue = MediaQuery.of(context).size.height * 0.0115;
    double customSize = 2.5;
    return customSize * unitHeightValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            alignment: Alignment.centerLeft,
            icon: Icon(Icons.search_rounded),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ConsultaProtocoloPage(),
                ),
              );
            },
          ),
        ],
        backgroundColor: Color.fromRGBO(203, 79, 36, 1),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Login_page(),
              ),
            );
          },
        ),
        title: Text(
          "PROTOCOLO DEFESA CIVIL",
          style: TextStyle(
            fontSize: sizeTextHeaderSet(context),
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            minLeadingWidth: 20,
            title: Text(
              "GM12345D - JARDINS",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Color.fromRGBO(203, 79, 36, 1),
              ),
            ),
            subtitle: Text(
              "Risco de Desabamento. \nRua Doutor Celso Oliva, 114",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            trailing: IconButton(
              icon: Icon(
                (Icons.cancel_outlined),
                color: Colors.red[800],
              ),
              onPressed: () {},
            ),
            leading: Container(
              width: 70,
              height: 50,
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    //                   <--- left side
                    color: Colors.black,
                    width: 4.0,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "100",
                    style: TextStyle(
                        color: Color.fromRGBO(203, 79, 36, 1),
                        fontSize: sizeTextHeaderSet(context) * 1.2,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            isThreeLine: true,
            onTap: () {},
          ),
          ListTile(
            minLeadingWidth: 20,
            title: Text(
              "GM12345D - BUGIO",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Color.fromRGBO(203, 79, 36, 1),
              ),
            ),
            subtitle: Text(
              "Risco de Desabamento. \nRua Doutor Celso Oliva, 114",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            trailing: IconButton(
              icon: Icon(
                (Icons.cancel_outlined),
                color: Colors.red[800],
              ),
              onPressed: () {},
            ),
            leading: Container(
              width: 70,
              height: 50,
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    //                   <--- left side
                    color: Colors.black,
                    width: 4.0,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "101",
                    style: TextStyle(
                        color: Color.fromRGBO(203, 79, 36, 1),
                        fontSize: sizeTextHeaderSet(context) * 1.2,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            isThreeLine: true,
            onTap: () {},
          ),
          ListTile(
            minLeadingWidth: 20,
            title: Text(
              "GM12345D - CENTRO",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Color.fromRGBO(203, 79, 36, 1),
              ),
            ),
            subtitle: Text(
              "Risco de Desabamento. \nRua Doutor Celso Oliva, 114",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            trailing: IconButton(
              icon: Icon(
                (Icons.cancel_outlined),
                color: Colors.red[800],
              ),
              onPressed: () {},
            ),
            leading: Container(
              width: 70,
              height: 50,
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    //                   <--- left side
                    color: Colors.black,
                    width: 4.0,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "102",
                    style: TextStyle(
                        color: Color.fromRGBO(203, 79, 36, 1),
                        fontSize: sizeTextHeaderSet(context) * 1.2,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            isThreeLine: true,
            onTap: () {},
          ),
          ListTile(
            minLeadingWidth: 20,
            title: Text(
              "GM12345D - JARDINS",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Color.fromRGBO(203, 79, 36, 1),
              ),
            ),
            subtitle: Text(
              "Risco de Desabamento. \nRua Doutor Celso Oliva, 114",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            trailing: IconButton(
              icon: Icon(
                (Icons.cancel_outlined),
                color: Colors.red[800],
              ),
              onPressed: () {},
            ),
            leading: Container(
              width: 70,
              height: 50,
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    //                   <--- left side
                    color: Colors.black,
                    width: 4.0,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "103",
                    style: TextStyle(
                        color: Color.fromRGBO(203, 79, 36, 1),
                        fontSize: sizeTextHeaderSet(context) * 1.2,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            isThreeLine: true,
            onTap: () {},
          ),
          ListTile(
            minLeadingWidth: 20,
            title: Text(
              "GM12345D - JARDINS",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Color.fromRGBO(203, 79, 36, 1),
              ),
            ),
            subtitle: Text(
              "Risco de Desabamento. \nRua Doutor Celso Oliva, 114",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            trailing: IconButton(
              icon: Icon(
                (Icons.cancel_outlined),
                color: Colors.red[800],
              ),
              onPressed: () {},
            ),
            leading: Container(
              width: 70,
              height: 50,
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    //                   <--- left side
                    color: Colors.black,
                    width: 4.0,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "104",
                    style: TextStyle(
                        color: Color.fromRGBO(203, 79, 36, 1),
                        fontSize: sizeTextHeaderSet(context) * 1.2,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            isThreeLine: true,
            onTap: () {},
          ),
          ListTile(
            minLeadingWidth: 20,
            title: Text(
              "GM12345D - JARDINS",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Color.fromRGBO(203, 79, 36, 1),
              ),
            ),
            subtitle: Text(
              "Risco de Desabamento. \nRua Doutor Celso Oliva, 114",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            trailing: IconButton(
              icon: Icon(
                (Icons.cancel_outlined),
                color: Colors.red[800],
              ),
              onPressed: () {},
            ),
            leading: Container(
              width: 70,
              height: 50,
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    //                   <--- left side
                    color: Colors.black,
                    width: 4.0,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "1452",
                    style: TextStyle(
                        color: Color.fromRGBO(203, 79, 36, 1),
                        fontSize: sizeTextHeaderSet(context) * 1.2,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            isThreeLine: true,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
