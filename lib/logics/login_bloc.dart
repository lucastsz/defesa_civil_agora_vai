import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:defesa_civil_agora_vai/banco/banco.dart';
import 'package:flutter/cupertino.dart';

class LoginBloc {
  // FirebaseFirestore db = FirebaseFirestore.instance;
  TextEditingController txtMatricula = TextEditingController();
  TextEditingController txtSenha = TextEditingController();
  Banco _banco = new Banco();

  void recuperaEdit() {
    print("Este é o de matricula ${txtMatricula.text}");
    print("Este é o de senha ${txtSenha.text}");
  }

  void criar() {
    _banco.db
        .collection("usuarios")
        .doc("002")
        .set({"nome": "Ricardo", "matricula": "2021004", "senha": "12345"});
  }

  // void buscarUsuario() async {
  //   QuerySnapshot querySnapshot = await _banco.db
  //       .collection("usuario")
  //       .where("nome", isEqualTo: "Roosewelt")
  //       .get();

  //   for (DocumentSnapshot item in querySnapshot.docs) {
  //     var dados = item.data();
  //     print("filtro matricula: ${dados["matricula"]}");
  //   }
  // }
  void pesquisar() async {
    DocumentSnapshot snapshot =
        await _banco.db.collection("usuarios").doc("003").get();
    var dados = snapshot.data();
    print("Dados exibicao: " + dados["nome"]);
  }

  Future entrarNoSistema() async {
    QuerySnapshot querySnapshot = await _banco.db
        .collection("usuarios")
        .where("matricula", isEqualTo: txtMatricula.text.toString())
        .get();
    for (DocumentSnapshot item in querySnapshot.docs) {
      var dados = item.data();
      print("Dados exibicao: ${dados["nome"]} idade: ${dados["matricula"]}");
      if (dados["senha"] == txtSenha.text.toString()) {
        print("Senha confere");
        return true;
      } else {
        print("Senha errada");
        return false;
      }
    }
  }
}
