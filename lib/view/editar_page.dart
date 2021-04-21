// import 'package:defesa_civil_protocolo_app/pages/consultar_protocolo.dart';
// import 'package:defesa_civil_protocolo_app/pages/login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:defesa_civil_agora_vai/banco/banco.dart';
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
      backgroundColor: Color.fromRGBO(32, 32, 86, 1.0),
      appBar: AppBar(
        actions: [
          IconButton(
            alignment: Alignment.centerLeft,
            icon: Icon(
              Icons.search_rounded,
              color: Colors.white,
              size: 25,
            ),
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
            size: 25,
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
      body: Column(
        children: [
          Expanded(child: ListView.builder(
              // itemCount: _protocolos.length,
              itemBuilder: (context, index) {
            final protocolo = [index];
            return Padding(
              padding: const EdgeInsets.all(9.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ListTile(
                    isThreeLine: true,
                    title: Text(
                      "GM12345D (27/01/2021)",
                      // "${protocolo.idProtocolo.toUpperCase()} (${protocolo.data})",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(203, 79, 36, 1),
                      ),
                    ),
                    subtitle: Text(
                      "TIPO NATUREZA\nLOCAL, Nº, BAIRRO",
                      // "${protocolo.natureza.toUpperCase()}\n${protocolo.local.toUpperCase()}, Nº${protocolo.numeroImovel}, ${protocolo.bairro.toUpperCase()}",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.grey[800]),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 60,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border(
                              left: BorderSide(
                                color: Colors.grey[200],
                                width: 3.0,
                              ),
                              right: BorderSide(
                                color: Colors.grey[200],
                                width: 3.0,
                              ),
                            ),
                          ),
                          child: Text(
                            " Nº 1   ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey[800],
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            //EDITAR PROTOCOLO
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: 16),
                            child: Icon(
                              Icons.edit,
                              size: 25,
                              color: Color.fromRGBO(32, 32, 86, 1.0),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            //REMOVER PROTOCOLO
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: 0),
                            child: Icon(
                              Icons.delete_forever_rounded,
                              size: 25,
                              color: Colors.red[700],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }))
        ],
      ),
    );
  }
}
