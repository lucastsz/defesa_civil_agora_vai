import 'package:defesa_civil_agora_vai/logics/login_bloc.dart';
import 'package:flutter/material.dart';

class Teste extends StatefulWidget {
  @override
  _TesteState createState() => _TesteState();
}

class _TesteState extends State<Teste> {
  @override
  Widget build(BuildContext context) {
    LoginBloc _bloc = LoginBloc();
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _bloc.txtMatricula,
            ),
            TextField(
              controller: _bloc.txtSenha,
            ),
            RaisedButton(
                color: Colors.red, onPressed: () => _bloc.recuperaEdit())
          ],
        ),
      ),
    );
  }
}
