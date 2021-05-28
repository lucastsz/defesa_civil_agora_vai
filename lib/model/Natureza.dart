class Natureza {
  String motivo;
  String tipoNatureza;

  Natureza(this.motivo, this.tipoNatureza);

  String get getMotivo {
    return motivo;
  }

  set setMotivo(String motivo) {
    this.motivo = motivo;
  }

  String get getTipoNatureza {
    return tipoNatureza;
  }

  set setTipoNatureza(String tipoNatureza) {
    this.tipoNatureza = tipoNatureza;
  }
}
