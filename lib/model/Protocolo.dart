import 'package:defesa_civil_agora_vai/model/Endereco.dart';
import 'package:defesa_civil_agora_vai/model/Natureza.dart';
import 'package:defesa_civil_agora_vai/model/Solicitante.dart';
import 'package:defesa_civil_agora_vai/model/Vistoria.dart';

class Protocolo {
  String idProtocolo;
  String dataCadastro;
  Solicitante solicitante;
  Vistoria vistoria;
  Endereco endereco;
  Natureza natureza;

  Protocolo(this.idProtocolo, this.dataCadastro, this.solicitante,
      this.endereco, this.natureza, this.vistoria);

  String get getidProtocolo {
    return idProtocolo;
  }

  set setidProtocolo(String idProtocolo) {
    this.idProtocolo = idProtocolo;
  }

  String get getDataCadastro {
    return dataCadastro;
  }

  set setDataCadastro(String dataCadastro) {
    this.dataCadastro = dataCadastro;
  }

  Solicitante get getSolicitante {
    return solicitante;
  }

  set setSolicitante(Solicitante solicitante) {
    this.solicitante = solicitante;
  }

  Vistoria get getVistoria {
    return vistoria;
  }

  set setVistoria(Vistoria vistoria) {
    this.vistoria = vistoria;
  }

  Endereco get getEndereco {
    return endereco;
  }

  set setEndereco(Endereco endereco) {
    this.endereco = endereco;
  }

  Natureza get getNatureza {
    return natureza;
  }

  set setNatureza(Natureza natureza) {
    this.natureza = natureza;
  }
}
