class Endereco {
  String local;
  String pontoReferencia;
  int numero;
  String bairro;

  Endereco(this.local, this.pontoReferencia, this.numero, this.bairro);

  String get getLocal {
    return local;
  }

  set setLocal(String local) {
    this.local = local;
  }

  String get getPontoReferencia {
    return pontoReferencia;
  }

  set setPontoReferencia(String pontoReferencia) {
    this.pontoReferencia = pontoReferencia;
  }

  int get getNumero {
    return numero;
  }

  set setNumero(int numero) {
    this.numero = numero;
  }

  String get getBairro {
    return bairro;
  }

  set setBairro(String bairro) {
    this.bairro = bairro;
  }
}
