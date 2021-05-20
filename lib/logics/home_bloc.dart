import 'package:defesa_civil_agora_vai/banco/banco.dart';
import 'package:flutter/cupertino.dart';

class HomeBloc {
  Banco _banco = new Banco();

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

  void clearTXT() {
    txtIdProtocolo.clear();
    txtData.clear();
    txtNomeSolicitante.clear();
    txtTelefone.clear();
    txtLocal.clear();
    txtPontoDeRef.clear();
    txtMotivo.clear();
    txtBairro.clear();
    txtTipoNatureza.clear();
  }

  void cadastrarProtocolo() {
    _banco.db.collection("protocolo").doc(txtIdProtocolo.text.toString()).set({
      "id": txtIdProtocolo.text.toString().toUpperCase(),
      "data": txtData.text.toString().toUpperCase(),
      "nomesolicitante": txtNomeSolicitante.text.toString().toUpperCase(),
      "telefone": txtTelefone.text.toString().toUpperCase(),
      "local": txtLocal.text.toString().toUpperCase(),
      "pontoderef": txtPontoDeRef.text.toString().toUpperCase(),
      "motivo": txtMotivo.text.toString().toUpperCase(),
      "numero": txtNumero.text.toString().toUpperCase(),
      "bairro": txtBairro.text.toString().toUpperCase(),
      "tiponatureza": txtTipoNatureza.text.toString().toUpperCase(),
    });
  }

  void cadastrarSolicitante() {
    _banco.db.collection("protocolo").doc(txtIdProtocolo.text.toString()).set({
      "id": txtIdProtocolo.text.toString().toUpperCase(),
      "data": txtData.text.toString().toUpperCase(),
      "nomesolicitante": txtNomeSolicitante.text.toString().toUpperCase(),
      "telefone": txtTelefone.text.toString().toUpperCase(),
      "local": txtLocal.text.toString().toUpperCase(),
      "pontoderef": txtPontoDeRef.text.toString().toUpperCase(),
      "motivo": txtMotivo.text.toString().toUpperCase(),
      "numero": txtNumero.text.toString().toUpperCase(),
      "bairro": txtBairro.text.toString().toUpperCase(),
      "tiponatureza": txtTipoNatureza.text.toString().toUpperCase(),
    });
  }

  void cadastrarEndereco() {
    _banco.db.collection("protocolo").doc(txtIdProtocolo.text.toString()).set({
      "id": txtIdProtocolo.text.toString().toUpperCase(),
      "data": txtData.text.toString().toUpperCase(),
      "nomesolicitante": txtNomeSolicitante.text.toString().toUpperCase(),
      "telefone": txtTelefone.text.toString().toUpperCase(),
      "local": txtLocal.text.toString().toUpperCase(),
      "pontoderef": txtPontoDeRef.text.toString().toUpperCase(),
      "motivo": txtMotivo.text.toString().toUpperCase(),
      "numero": txtNumero.text.toString().toUpperCase(),
      "bairro": txtBairro.text.toString().toUpperCase(),
      "tiponatureza": txtTipoNatureza.text.toString().toUpperCase(),
    });
  }
}
