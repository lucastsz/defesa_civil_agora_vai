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

  void clearTXT() {
    txtIdProtocolo.clear();
    txtData.clear();
    txtNomeSolicitante.clear();
    txtTelefone.clear();
    txtLocal.clear();
    txtPontoDeRef.clear();
    txtMotivo.clear();
  }

  void cadastrar() {
    _banco.db.collection("protocolo").doc(txtIdProtocolo.text.toString()).set({
      "id": txtIdProtocolo.text.toString(),
      "data": txtData.text.toString(),
      "nomesolicitante": txtNomeSolicitante.text.toString(),
      "telefone": txtTelefone.text.toString(),
      "local": txtLocal.text.toString(),
      "pontoderef": txtPontoDeRef.text.toString(),
      "motivo": txtMotivo.text.toString(),
      "numero": txtNumero.text.toString()
    });
  }
}
