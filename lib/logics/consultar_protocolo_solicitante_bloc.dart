import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:defesa_civil_agora_vai/banco/banco.dart';
import 'package:flutter/widgets.dart';

class ConsultarProtocoloSolicitanteBloc {
  Banco _banco = new Banco();

  TextEditingController txtPesquisa = TextEditingController();
  TextEditingController txtIdProtocoloS = TextEditingController();
  TextEditingController txtDataS = TextEditingController();
  TextEditingController txtNomeSolicitanteS = TextEditingController();
  TextEditingController txtTelefoneS = TextEditingController();
  TextEditingController txtLocalS = TextEditingController();
  TextEditingController txtPontoDeRefS = TextEditingController();
  TextEditingController txtNumeroS = TextEditingController();
  TextEditingController txtBairro = TextEditingController();
  TextEditingController txtMotivoS = TextEditingController();
  TextEditingController txtTipoNatureza = TextEditingController();
  TextEditingController txtObservacao = TextEditingController();
  String txtSituacao;

  Future<bool> verificar() async {
    QuerySnapshot querySnapshot = await _banco.db
        .collection("protocolo")
        .where("id", isEqualTo: txtPesquisa.text.toString())
        .get();
    for (DocumentSnapshot item in querySnapshot.docs) {
      var dados = item.data();
      print(
          "Dados exibicao: ${dados["id"]} idade: ${dados["nomesolicitante"]}");
      if (dados["id"] == txtPesquisa.text.toString()) {
        print("Achei !");
        return true;
      }
    }
    return false;
  }

  Future preencherCampos(String pesquisa) async {
    DocumentSnapshot snapshot =
        await _banco.db.collection("protocolo").doc(pesquisa).get();
    var dados = snapshot.data();
    print(
        "Dados exibicao: ${dados["id"]} nome: ${dados["nomesolicitante"]}  pesquisa: $txtPesquisa");
    txtIdProtocoloS.text = dados["id"].toString();
    txtDataS.text = dados["data"].toString();
    txtLocalS.text = dados["local"].toString();
    txtMotivoS.text = dados["motivo"].toString();
    txtNomeSolicitanteS.text = dados["nomesolicitante"];
    txtPontoDeRefS.text = dados["pontoderef"];
    txtTelefoneS.text = dados["telefone"];
    txtNumeroS.text = dados["numero"];
    txtObservacao.text = dados["observacao"];
    txtSituacao = dados["situacao"];
  }
}
