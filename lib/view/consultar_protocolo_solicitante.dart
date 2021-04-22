import 'package:defesa_civil_agora_vai/logics/consultar_protocolo_solicitante_bloc.dart';
import 'package:defesa_civil_agora_vai/view/consultar_protocolo.dart';
import 'package:defesa_civil_agora_vai/view/solicitante_protocolo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ConsultarProcoloSolicitantePage extends StatefulWidget {
  @override
  _ConsultarProcoloSolicitantePageState createState() =>
      _ConsultarProcoloSolicitantePageState();
}

class _ConsultarProcoloSolicitantePageState
    extends State<ConsultarProcoloSolicitantePage> {
  ConsultarProtocoloSolicitanteBloc _bloc =
      new ConsultarProtocoloSolicitanteBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(203, 79, 36, 1),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Consultar Protocolo",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              //
              SizedBox(
                height: MediaQuery.of(context).size.height * .05,
              ),

              Text(
                "Digite o id do protocolo:",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: sizeTextHeaderSet(context),
                ),
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height * .05,
              ),

              Container(
                height: MediaQuery.of(context).size.height * .085,
                width: MediaQuery.of(context).size.width * .74,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: TextField(
                  controller: _bloc.txtPesquisa,
                  textCapitalization: TextCapitalization.characters,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(8),
                  ],
                  style: TextStyle(fontSize: 17),
                  decoration: InputDecoration(
                      hoverColor: Colors.black,
                      prefixIcon: Icon(
                        Icons.source_rounded,
                        color: Color.fromRGBO(203, 79, 36, 1),
                      ),
                      hintText: 'GM12345D',
                      hintStyle: TextStyle(
                        height: 3.10,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height * .43,
              ),

              GestureDetector(
                onTap: () async {
                  _bloc.txtPesquisa.text = _bloc.txtPesquisa.text.toUpperCase();
                  bool entrar = await _bloc.verificar();

                  if (entrar) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            SolicitanteProtocolo(_bloc.txtPesquisa.text),
                      ),
                    );
                  } else {
                    AlertDialog(
                      actions: <Widget>[
                        Text("Esse protocolo não existe"),
                        FlatButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("Fechar"))
                      ],
                    );
                  }
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * .070,
                  width: MediaQuery.of(context).size.width * .35,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(32, 32, 86, 1),
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "PESQUISAR",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: sizeTextHeaderSet(context),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
