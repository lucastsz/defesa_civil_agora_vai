class Agente {
  String nome;
  String cargo;
  String matricula;
  String senha;

  Agente(this.nome, this.cargo, this.matricula, this.senha);

  String get getNome {
    return nome;
  }

  set setNome(String nome) {
    this.nome = nome;
  }

  String get getCargo {
    return cargo;
  }

  set setCargo(String cargo) {
    this.cargo = cargo;
  }

  String get getMatricula {
    return matricula;
  }

  set setMatricula(String matricula) {
    this.matricula = matricula;
  }

  String get getSenha {
    return senha;
  }

  set setSenha(String senha) {
    this.senha = senha;
  }
}
