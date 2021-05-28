class Solicitante {
  String nome;
  String telefone;
  bool anonimo;

  Solicitante(this.nome, this.telefone, this.anonimo);

  String get getNome {
    return nome;
  }

  set setNome(String nome) {
    this.nome = nome;
  }

  String get getTelefone {
    return telefone;
  }

  set setTelefone(String telefone) {
    this.telefone = telefone;
  }

  bool get getAnonimo {
    return anonimo;
  }

  set setAnonimo(bool anonimo) {
    this.anonimo = anonimo;
  }
}
