import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:defesa_civil_agora_vai/banco/banco.dart';
import 'package:flutter/material.dart';

class EditarBloc {
  Map<String, dynamic> item;
  Banco _banco = Banco();

  EditarBloc({this.item});
  TextEditingController txtIdProtocolo = TextEditingController();
  TextEditingController txtData = TextEditingController();
  TextEditingController txtNomeSolicitante = TextEditingController();
  TextEditingController txtTelefone = TextEditingController();
  TextEditingController txtLocal = TextEditingController();
  TextEditingController txtPontoDeRef = TextEditingController();
  TextEditingController txtNumero = TextEditingController();
  TextEditingController txtMotivo = TextEditingController();
  TextEditingController txtBairro = TextEditingController();
  TextEditingController txtTipoNatureza = TextEditingController();
  TextEditingController txtObservacao = TextEditingController();

  void preencherItens() {
    txtIdProtocolo.text = item["id"];
    txtData.text = item["data"];
    txtNomeSolicitante.text = item["nomesolicitante"];
    txtTelefone.text = item["telefone"];
    txtPontoDeRef.text = item["pontoderef"];
    txtLocal.text = item["local"];
    txtNumero.text = item["numero"];
    txtMotivo.text = item["motivo"];
    txtBairro.text = item["bairro"];
    txtTipoNatureza.text = item["tiponatureza"];
    txtObservacao.text = item["observacao"];
  }

  void cadastrarProtocolo(bool anonimo, String radioItem) {
    String nomeNomeSolicitante =
        txtNomeSolicitante.text.toString().toUpperCase();
    String situacao = radioItem;

    if (anonimo == true) {
      nomeNomeSolicitante = "ANÔNIMO";
    }
    if (radioItem == "Sim") {
      situacao = "VISTORIADO";
    } else {
      situacao = "NÃO VISTORIADO";
    }

    _banco.db.collection("protocolo").doc(txtIdProtocolo.text.toString()).set({
      "id": txtIdProtocolo.text.toString().toUpperCase(),
      "data": txtData.text.toString().toUpperCase(),
      "nomesolicitante": nomeNomeSolicitante,
      "telefone": txtTelefone.text.toString().toUpperCase(),
      "local": txtLocal.text.toString().toUpperCase(),
      "pontoderef": txtPontoDeRef.text.toString().toUpperCase(),
      "numero": txtNumero.text.toString().toUpperCase(),
      "bairro": txtBairro.text.toString().toUpperCase(),
      "tiponatureza": txtTipoNatureza.text.toString().toUpperCase(),
      "motivo": txtMotivo.text.toString().toUpperCase(),
      "situacao": situacao.toString(),
      "observacao": txtObservacao.text.toString().toUpperCase(),
    });
  }

  void cadastrarSolicitante(bool anonimo) {
    if (anonimo == true) {
      txtNomeSolicitante.text = "ANÔNIMO";
    }

    _banco.db.collection("solicitante").doc(txtIdProtocolo.text.toString()).set(
      {
        "nomesolicitante": txtNomeSolicitante.text.toString().toUpperCase(),
        "telefone": txtTelefone.text.toString().toUpperCase(),
      },
    );
  }

  void cadastrarEndereco() {
    _banco.db.collection("endereco").doc(txtIdProtocolo.text.toString()).set(
      {
        "local": txtLocal.text.toString().toUpperCase(),
        "pontoderef": txtPontoDeRef.text.toString().toUpperCase(),
        "numero": txtNumero.text.toString().toUpperCase(),
        "bairro": txtBairro.text.toString().toUpperCase(),
      },
    );
  }
}
