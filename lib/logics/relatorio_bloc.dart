import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:defesa_civil_agora_vai/banco/banco.dart';
import 'package:defesa_civil_agora_vai/view/relatorio_page.dart';

class RelatorioBloc {
  int vistoriadas;
  int anonimos;
  int cadastradas;

  Banco banco;
  RelatorioBloc() {
    banco = Banco();
    recuperaAnonimo();
    recuperaCadastradas();
    recuperaVistoriadas();
  }

  recuperaCadastradas() async {
    QuerySnapshot querySnapshot = await banco.db.collection("protocolo").get();
    vistoriadas = querySnapshot.docs.length;
  }

  recuperaAnonimo() async {
    QuerySnapshot querySnapshot = await banco.db
        .collection("protocolo")
        .where("nomesolicitante", isEqualTo: "ANÔNIMO")
        .get();
    anonimos = querySnapshot.docs.length;
  }

  recuperaVistoriadas() async {
    QuerySnapshot querySnapshot = await banco.db
        .collection("protocolo")
        .where("situacao", isEqualTo: "NÃO VISTORIADO")
        .get();
    vistoriadas = querySnapshot.docs.length;
  }
}
