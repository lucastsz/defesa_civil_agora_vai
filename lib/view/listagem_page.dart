import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:defesa_civil_agora_vai/banco/banco.dart';
import 'package:defesa_civil_agora_vai/view/editar_page.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class ListagemPage extends StatefulWidget {
  @override
  _ListagemPageState createState() => _ListagemPageState();
}

class _ListagemPageState extends State<ListagemPage> {
  double sizeTextHeaderSet(context) {
    double unitHeightValue = MediaQuery.of(context).size.height * 0.0115;
    double customSize = 2.5;
    return customSize * unitHeightValue;
  }

  Banco _banco;

  @override
  @override
  void initState() {
    _banco = new Banco();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromRGBO(203, 79, 36, 1),
        actions: [
          IconButton(
            onPressed: () {
              //Aqui abre uma tela para filtros
            },
            icon: const Icon(
              Icons.filter_alt_rounded,
              color: Colors.white,
            ),
          ),
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
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: StreamBuilder(
                stream: _banco.db.collection("protocolo").snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.data == null) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return ListView.builder(
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (BuildContext context, int i) {
                        QueryDocumentSnapshot doc = snapshot.data.docs[i];
                        Map<String, dynamic> item = doc.data();

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 7.0,
                                      offset: Offset(8.0, 8.0))
                                ]),
                            child: ListTile(
                              isThreeLine: true,
                              title: Text(
                                "${item['id']} (${item['data']})",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(203, 79, 36, 1),
                                ),
                              ),
                              subtitle: Text(
                                "${item['nomesolicitante']}\n${item['local']}, ${item['numero']}, ${item['bairro']}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey[800]),
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
                                      " Nº ${i + 1}   ",
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
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            titleTextStyle: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20,
                                            ),
                                            title: Text(
                                                "Tem certeza que deseja editar o protocolo ${item["id"]}?"),
                                            actions: <Widget>[
                                              FlatButton(
                                                height: 35,
                                                minWidth: 20,
                                                color: Colors.red[700],
                                                onPressed: () =>
                                                    Navigator.pop(context),
                                                child: Text(
                                                  "  Não  ",
                                                  style: TextStyle(
                                                    fontSize: sizeTextHeaderSet(
                                                            context) *
                                                        0.85,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: .09,
                                              ),
                                              FlatButton(
                                                height: 35,
                                                minWidth: 20,
                                                color: Colors.green[800],
                                                onPressed: () {
                                                  Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          EditarPage(
                                                        item: item,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Text(
                                                  "  Sim  ",
                                                  style: TextStyle(
                                                    fontSize: sizeTextHeaderSet(
                                                            context) *
                                                        0.85,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 1,
                                              ),
                                            ],
                                          );
                                        },
                                      );
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
                                  Padding(
                                    padding: EdgeInsets.only(right: 0),
                                    child: GestureDetector(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              titleTextStyle: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20,
                                              ),
                                              title: Text(
                                                  "Tem certeza que deseja excluir o protocolo ${item["id"]}?"),
                                              actions: <Widget>[
                                                FlatButton(
                                                  height: 35,
                                                  minWidth: 20,
                                                  color: Colors.red[700],
                                                  onPressed: () =>
                                                      Navigator.pop(context),
                                                  child: Text(
                                                    "  Não  ",
                                                    style: TextStyle(
                                                      fontSize:
                                                          sizeTextHeaderSet(
                                                                  context) *
                                                              0.85,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: .09,
                                                ),
                                                FlatButton(
                                                  height: 35,
                                                  minWidth: 20,
                                                  color: Colors.green[800],
                                                  onPressed: () {
                                                    doc.reference.delete();
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                    "  Sim  ",
                                                    style: TextStyle(
                                                      fontSize:
                                                          sizeTextHeaderSet(
                                                                  context) *
                                                              0.85,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 1,
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
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
                        );
                      });
                }),
          )
        ],
      ),
    );
  }
}
