import 'package:defesa_civil_agora_vai/logics/consultar_protocolo_solicitante_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../logics/BuildDropdown.dart';

class SolicitanteProtocolo extends StatefulWidget {
  SolicitanteProtocolo(this.pesquisa);
  final String pesquisa;
  @override
  _SolicitanteProtocoloState createState() => _SolicitanteProtocoloState();
}

class _SolicitanteProtocoloState extends State<SolicitanteProtocolo> {
  ConsultarProtocoloSolicitanteBloc _bloc;

  bool checkAnonimo = false;
  void VerificaAnonimo() {
    checkAnonimo = false;
    if (checkAnonimo == true) {
      _bloc.txtNomeSolicitanteS.clear();
    } else {
      setState(() {
        checkAnonimo = false;
      });
    }
  }

  //mascara numero
  var numbermaskFormatter = new MaskTextInputFormatter(
    mask: '(##) #.####-####)',
    filter: {
      "#": RegExp(
        r'[0-9]',
        caseSensitive: true,
        unicode: true,
      )
    },
  );

  //mascara data
  var datemaskFormatter = new MaskTextInputFormatter(
    mask: '##/##/####',
    filter: {
      "#": RegExp(
        r'[0-9]',
        caseSensitive: true,
        unicode: true,
      )
    },
  );

  //redimensionar texto responsivamente
  double sizeTextHeaderSet(context) {
    double unitHeightValue = MediaQuery.of(context).size.height * 0.0115;
    double customSize = 2.5;
    return customSize * unitHeightValue;
  }

  @override
  void initState() {
    _bloc = new ConsultarProtocoloSolicitanteBloc();
    _bloc.preencherCampos(widget.pesquisa);
  }

  @override
  Widget build(BuildContext context) {
    // HomeBloc _bloc =  new HomeBloc();
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: 24,
              ),
              Container(
                alignment: Alignment.centerLeft,
                color: Color.fromRGBO(32, 32, 86, 1.0),
                height: MediaQuery.of(context).size.height * .07,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.only(left: 38),
                  child: Text(
                    "PROTOCOLO",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: sizeTextHeaderSet(context) * 1.2,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              //
              Container(
                height: MediaQuery.of(context).size.height * .03,
              ),

              //
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * .44,
                    height: MediaQuery.of(context).size.height * .1,
                    child: TextField(
                      controller: _bloc.txtIdProtocoloS,
                      textCapitalization: TextCapitalization.characters,
                      inputFormatters: [LengthLimitingTextInputFormatter(8)],
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.all(5),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(32, 32, 86, 1.0),
                              style: BorderStyle.solid,
                              width: 3),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(203, 79, 36, 1),
                                style: BorderStyle.solid,
                                width: 3)),
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: sizeTextHeaderSet(context) * 1,
                        ),
                        labelText: 'ID Protocolo',
                        prefixIcon: const Icon(
                          Icons.source_rounded,
                          color: Color.fromRGBO(203, 79, 36, 1),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .03,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * .42,
                    height: MediaQuery.of(context).size.height * .1,
                    child: TextField(
                      controller: _bloc.txtDataS,
                      keyboardType: TextInputType.datetime,
                      inputFormatters: [datemaskFormatter],
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.all(5),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(32, 32, 86, 1.0),
                              style: BorderStyle.solid,
                              width: 3),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(203, 79, 36, 1),
                                style: BorderStyle.solid,
                                width: 3)),
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: sizeTextHeaderSet(context) * 1,
                        ),
                        labelText: 'Data',
                        prefixIcon: const Icon(
                          Icons.calendar_today_rounded,
                          color: Color.fromRGBO(203, 79, 36, 1),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              //
              Container(
                height: MediaQuery.of(context).size.height * .03,
              ),
              //

              Container(
                alignment: Alignment.centerLeft,
                color: Color.fromRGBO(32, 32, 86, 1.0),
                height: MediaQuery.of(context).size.height * .07,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.only(left: 38),
                  child: Text(
                    "SOLICITANTE",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: sizeTextHeaderSet(context) * 1.2,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              //
              Container(
                height: MediaQuery.of(context).size.height * .03,
              ),
              //
              //
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * .1,
                child: TextField(
                  controller: _bloc.txtNomeSolicitanteS,
                  textCapitalization: TextCapitalization.characters,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(5),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                          color: Color.fromRGBO(32, 32, 86, 1.0),
                          style: BorderStyle.solid,
                          width: 3),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                            color: Color.fromRGBO(203, 79, 36, 1),
                            style: BorderStyle.solid,
                            width: 3)),
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: sizeTextHeaderSet(context) * 1,
                    ),
                    labelText: 'Nome Solicitante',
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Color.fromRGBO(203, 79, 36, 1),
                    ),
                  ),
                  onTap: () {
                    VerificaAnonimo();
                  },
                ),
              ),

              //

              Container(
                height: MediaQuery.of(context).size.height * .02,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * .05,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * .1,
                    child: TextField(
                      onTap: () {
                        VerificaAnonimo();
                      },
                      controller: _bloc.txtTelefoneS,
                      keyboardType: TextInputType.datetime,
                      inputFormatters: [numbermaskFormatter],
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.all(5),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(32, 32, 86, 1.0),
                              style: BorderStyle.solid,
                              width: 3),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(203, 79, 36, 1),
                                style: BorderStyle.solid,
                                width: 3)),
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: sizeTextHeaderSet(context) * 1,
                        ),
                        labelText: 'Telefone',
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Color.fromRGBO(203, 79, 36, 1),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Container(
                height: MediaQuery.of(context).size.height * .03,
              ),
              //

              Container(
                alignment: Alignment.centerLeft,
                color: Color.fromRGBO(32, 32, 86, 1.0),
                height: MediaQuery.of(context).size.height * .07,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.only(left: 38),
                  child: Text(
                    "ENDEREÇO",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: sizeTextHeaderSet(context) * 1.2,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              //
              Container(
                height: MediaQuery.of(context).size.height * .03,
              ),

              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * .1,
                child: TextField(
                  controller: _bloc.txtLocalS,
                  textCapitalization: TextCapitalization.characters,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(5),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                          color: Color.fromRGBO(32, 32, 86, 1.0),
                          style: BorderStyle.solid,
                          width: 3),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                            color: Color.fromRGBO(203, 79, 36, 1),
                            style: BorderStyle.solid,
                            width: 3)),
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: sizeTextHeaderSet(context) * 1,
                    ),
                    labelText: 'Local',
                    prefixIcon: const Icon(
                      Icons.directions_rounded,
                      color: Color.fromRGBO(203, 79, 36, 1),
                    ),
                  ),
                ),
              ),
              //
              Container(
                height: MediaQuery.of(context).size.height * .02,
              ),

              //
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * .1,
                child: TextField(
                  controller: _bloc.txtPontoDeRefS,
                  textCapitalization: TextCapitalization.characters,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(5),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                          color: Color.fromRGBO(32, 32, 86, 1.0),
                          style: BorderStyle.solid,
                          width: 3),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                            color: Color.fromRGBO(203, 79, 36, 1),
                            style: BorderStyle.solid,
                            width: 3)),
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: sizeTextHeaderSet(context) * 1,
                    ),
                    labelText: 'Ponto de Referência',
                    prefixIcon: const Icon(
                      Icons.navigation_rounded,
                      color: Color.fromRGBO(203, 79, 36, 1),
                    ),
                  ),
                ),
              ),
              //
              Container(
                height: MediaQuery.of(context).size.height * .02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * .30,
                    height: MediaQuery.of(context).size.height * .1,
                    child: TextField(
                      controller: _bloc.txtNumeroS,
                      keyboardType: TextInputType.datetime,
                      inputFormatters: [LengthLimitingTextInputFormatter(5)],
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.all(5),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(32, 32, 86, 1.0),
                              style: BorderStyle.solid,
                              width: 3),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(203, 79, 36, 1),
                                style: BorderStyle.solid,
                                width: 3)),
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: sizeTextHeaderSet(context) * 1,
                        ),
                        labelText: 'Nº',
                        prefixIcon: const Icon(
                          Icons.home_work,
                          color: Color.fromRGBO(203, 79, 36, 1),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .04,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * .55,
                    height: MediaQuery.of(context).size.height * .1,
                    child: TextField(
                      controller: _bloc.txtBairroS,
                      keyboardType: TextInputType.datetime,
                      inputFormatters: [LengthLimitingTextInputFormatter(5)],
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.all(5),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(32, 32, 86, 1.0),
                              style: BorderStyle.solid,
                              width: 3),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(203, 79, 36, 1),
                                style: BorderStyle.solid,
                                width: 3)),
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: sizeTextHeaderSet(context) * 1,
                        ),
                        labelText: 'Bairro',
                        prefixIcon: const Icon(
                          Icons.location_on_rounded,
                          color: Color.fromRGBO(203, 79, 36, 1),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              //
              Container(
                height: MediaQuery.of(context).size.height * .03,
              ),
              //

              Container(
                alignment: Alignment.centerLeft,
                color: Color.fromRGBO(32, 32, 86, 1.0),
                height: MediaQuery.of(context).size.height * .07,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.only(left: 38),
                  child: Text(
                    "NATUREZA",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: sizeTextHeaderSet(context) * 1.2,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              Container(
                height: MediaQuery.of(context).size.height * .04,
              ),

              Container(
                alignment: Alignment.center,
                height: 100,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(5),
                    topLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                  ),
                  border: Border.all(
                    color: Color.fromRGBO(203, 79, 36, 1),
                    width: 3,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: TextField(
                    controller: _bloc.txtMotivoS,
                    maxLines: 7,
                    minLines: 5,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Motivo',
                      hintStyle: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),

              Container(
                height: MediaQuery.of(context).size.height * .03,
              ),

              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * .1,
                child: TextField(
                  controller: _bloc.txtTipoNatureza,
                  textCapitalization: TextCapitalization.characters,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(5),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                          color: Color.fromRGBO(32, 32, 86, 1.0),
                          style: BorderStyle.solid,
                          width: 3),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                            color: Color.fromRGBO(203, 79, 36, 1),
                            style: BorderStyle.solid,
                            width: 3)),
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: sizeTextHeaderSet(context) * 1,
                    ),
                    labelText: 'Tipo de Natureza',
                    prefixIcon: const Icon(
                      Icons.new_releases_rounded,
                      color: Color.fromRGBO(203, 79, 36, 1),
                    ),
                  ),
                ),
              ),

              Container(
                height: MediaQuery.of(context).size.height * .04,
              ),
              //

              Container(
                alignment: Alignment.centerLeft,
                color: Color.fromRGBO(32, 32, 86, 1.0),
                height: MediaQuery.of(context).size.height * .07,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.only(left: 38),
                  child: Text(
                    "SITUAÇÃO",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: sizeTextHeaderSet(context) * 1.2,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * .05,
              ),
              Text(
                _bloc.txtSituacao.toString(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              Container(
                height: MediaQuery.of(context).size.height * .05,
              ),
              Container(
                alignment: Alignment.center,
                height: 100,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(5),
                    topLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                  ),
                  border: Border.all(
                    color: Color.fromRGBO(203, 79, 36, 1),
                    width: 3,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: TextField(
                    controller: _bloc.txtObservacao,
                    maxLines: 7,
                    minLines: 5,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Observação (Opcional)',
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: sizeTextHeaderSet(context) * 1,
                      ),
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: sizeTextHeaderSet(context) * 1,
                      ),
                    ),
                  ),
                ),
              ),

              Container(
                height: MediaQuery.of(context).size.height * .06,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
