class Vistoria {
  List agentes;
  //aqui tem que ter ou armazenar a lista dos agentes que participaram da vistoria do protocolo X
  //voce vê o que acha melhor, armazenar uma lista dentro de uma só vistoria ou algo do tipo

  String observacao;
  String dataVistoria;

  bool vistoriaRealizada;
  // se for false: exibirá um texto na tela que a vistoria está pendente
  // se for true: exibirá um texto na tela que a vistoria foi realizada

  Vistoria(this.agentes, this.observacao, this.vistoriaRealizada);

  List get getAgentes {
    return agentes;
  }

  set setAgentes(List agentes) {
    this.agentes = agentes;
  }

  String get getDataVistoria {
    return dataVistoria;
  }

  set setDataVistoria(String dataVistoria) {
    this.dataVistoria = dataVistoria;
  }

  String get getObservacao {
    return observacao;
  }

  set setObservacao(String observacao) {
    this.observacao = observacao;
  }

  bool get getVistoriaRealizada {
    return vistoriaRealizada;
  }

  set getVistoriaRealizada(bool observacao) {
    this.vistoriaRealizada = vistoriaRealizada;
  }
}
