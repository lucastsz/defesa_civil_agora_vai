import 'package:defesa_civil_agora_vai/logics/consultar_protocolo_solicitante_bloc.dart';
import 'package:defesa_civil_agora_vai/view/consultar_protocolo.dart';
import 'package:defesa_civil_agora_vai/view/solicitante_protocolo.dart';
import 'package:flutter/material.dart';

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  color: Colors.red,
                  height: 100,
                  width: 100,
                ),
                TextFormField(
                  controller: _bloc.txtPesquisa,
                ),
                RaisedButton(onPressed: () async {
                  bool entrar = await _bloc.verificar();

                  if (entrar) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SolicitanteProtocolo(
                            _bloc.txtPesquisa.text.toString()),
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
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
