import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:defesa_civil_agora_vai/banco/banco.dart';

class ListagemBloc {
  Banco _banco = new Banco();

  Future getProtocolos() async {
    QuerySnapshot qs = await _banco.db.collection("protocolo").get();
    return qs.docs;
  }
}
