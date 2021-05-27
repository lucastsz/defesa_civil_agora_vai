import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:defesa_civil_agora_vai/banco/banco.dart';
import 'package:flutter/material.dart';

class Clientes extends StatefulWidget {
  @override
  _ClientesState createState() => _ClientesState();
}

class _ClientesState extends State<Clientes> {
  Banco _banco = new Banco();

  Future getClientes() async {
    QuerySnapshot qn = await _banco.db.collection("protocolo").get();

    return qn.docs;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.blue,
              actions: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Icon(Icons.search),
                )
              ],
              title: Center(
                child: Text("Clientes"),
              )),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: FutureBuilder(
                    future: getClientes(),
                    builder: (_, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return new Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return ListView.builder(
                            itemCount: snapshot.data.docs.length,
                            itemBuilder: (BuildContext context, int i) {
                              var item = snapshot.data.docs[i].data();
                              return ListTile(
                                title: Text(item['id'].toString()),
                              );
                            });
                        ;
                      }
                    }),
              ),
            ],
          )),
    );
  }
}
