import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:defesa_civil_agora_vai/logics/editar_bloc.dart';
import 'package:defesa_civil_agora_vai/logics/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../logics/BuildDropdown.dart';
import 'login_page.dart';
import 'navigator_page.dart';

class EditarPage extends StatefulWidget {
  Map<String, dynamic> item;
  EditarPage({this.item});
  @override
  _EditarPageState createState() => _EditarPageState();
}

class _EditarPageState extends State<EditarPage> {
  EditarBloc _bloc;
  String bairro;
  String tipoNatureza;

  Future<void> VerificaAnonimo() async {
    checkAnonimo = false;
    if (checkAnonimo == true) {
      _bloc.txtNomeSolicitante.clear();
    } else {
      setState(() {
        checkAnonimo = false;
      });
    }
  }

  String radioItem = 'Não';

  //redimensionar texto responsivamente
  double sizeTextHeaderSet(context) {
    double unitHeightValue = MediaQuery.of(context).size.height * 0.0115;
    double customSize = 2.5;
    return customSize * unitHeightValue;
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
  bool checkAnonimo = false;

  @override
  void initState() {
    _bloc = EditarBloc(item: widget.item);
    _bloc.preencherItens();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromRGBO(203, 79, 36, 1),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop(
                  MaterialPageRoute(
                    builder: (context) => Login_page(),
                  ),
                );
              },
              icon: const Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
            ),
          )
        ],
        title: Text(
          "DEFESA CIVIL ARACAJU",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
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
                      controller: _bloc.txtIdProtocolo,
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
                      controller: _bloc.txtData,
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
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * .1,
                child: TextField(
                  controller: _bloc.txtNomeSolicitante,
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
                    width: MediaQuery.of(context).size.width * .54,
                    height: MediaQuery.of(context).size.height * .1,
                    child: TextField(
                      onTap: () {
                        VerificaAnonimo();
                      },
                      controller: _bloc.txtTelefone,
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
                        prefixIcon: const Icon(
                          Icons.phone,
                          color: Color.fromRGBO(203, 79, 36, 1),
                        ),
                      ),
                    ),
                  ),
                  Theme(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          width: 35,
                          child: Checkbox(
                            checkColor: Colors.white,
                            activeColor: Color.fromRGBO(203, 79, 36, 1),
                            value: checkAnonimo,
                            onChanged: (newValue) {
                              setState(
                                () {
                                  _bloc.txtNomeSolicitante.clear();
                                  checkAnonimo = !checkAnonimo;
                                },
                              );
                            },
                          ),
                        ),
                        Text(
                          "Anônimo",
                          style: TextStyle(
                              color: Colors.grey[900],
                              fontSize: sizeTextHeaderSet(context) * 0.89,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    data: ThemeData(
                      unselectedWidgetColor: Color.fromRGBO(203, 79, 36, 1),
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
                  controller: _bloc.txtLocal,
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
                      Icons.location_on_rounded,
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
                  controller: _bloc.txtPontoDeRef,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * .30,
                    height: MediaQuery.of(context).size.height * .1,
                    child: TextField(
                      controller: _bloc.txtNumero,
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
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromRGBO(203, 79, 36, 1),
                            style: BorderStyle.solid,
                            width: 3),
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * .55,
                      child: BuildDropdown(
                        itemsList: [
                          'Selecione o Bairro',
                          '13 de Julho',
                          '17 de Março',
                          'Aeroporto',
                          'América',
                          'Atalaia',
                          'Bugio',
                          'Capucho',
                          'Centro',
                          'Cidade Nova',
                          'Cirurgia',
                          'Coroa do Meio',
                          'Dezoito do Forte',
                          'Dom Luciano',
                          'Farolândia',
                          'Getúlio Vargas',
                          'Grageru',
                          'Inácio Barbosa',
                          'Industrial',
                          'Jabotiana',
                          'Japãozinho',
                          'Jardim Centenário',
                          'Jardins',
                          'José C. de Araújo',
                          'Lamarão',
                          'Luzia',
                          'Marivan',
                          'Novo Paraíso',
                          'Olaria',
                          'Palestina',
                          'Pereira Lobo',
                          'Ponto Novo',
                          'Porto Dantas',
                          'Salgado Filho',
                          'Santa Maria',
                          'Santo Antônio',
                          'Santos Dumont',
                          'São Conrado',
                          'São José',
                          'Siqueira Campos',
                          'Soledade',
                          'Suíssa',
                          'Zona de Expansão',
                        ],
                        defaultValue: 'Selecione o Bairro',
                        onChanged: (value) {
                          bairro = value;
                          _bloc.txtBairro.text = bairro;
                        },
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
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * .07,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromRGBO(203, 79, 36, 1),
                        style: BorderStyle.solid,
                        width: 3),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * .9,
                  child: BuildDropdown(
                    itemsList: [
                      'Selecione o tipo de Natureza',
                      'Alagamento/Enchente/Inundação',
                      'Desabamento',
                      'Deslizamento',
                      'Risco de Desabamento',
                      'Risco de Deslizamento',
                      'Retirada de Parede',
                      'Risco Explosivo/Químico/Radioativo/Biológico',
                      'Outro',
                    ],
                    defaultValue: 'Selecione o tipo de Natureza',
                    onChanged: (value) {
                      tipoNatureza = value;
                      _bloc.txtTipoNatureza.text = tipoNatureza;
                    },
                  ),
                ),
              ),

              Container(
                height: MediaQuery.of(context).size.height * .03,
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
                    controller: _bloc.txtMotivo,
                    maxLines: 7,
                    minLines: 5,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Motivo',
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

//
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
                height: MediaQuery.of(context).size.height * .02,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: RadioListTile(
                  activeColor: Color.fromRGBO(32, 32, 86, 1),
                  groupValue: radioItem,
                  title: Text(
                    'Vistoriada',
                    style: TextStyle(
                      fontSize: sizeTextHeaderSet(context) * 1,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  value: 'Sim',
                  onChanged: (val) {
                    setState(() {
                      radioItem = val;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: RadioListTile(
                  activeColor: Color.fromRGBO(32, 32, 86, 1),
                  groupValue: radioItem,
                  title: Text(
                    'Não Vistoriada',
                    style: TextStyle(
                      fontSize: sizeTextHeaderSet(context) * 1,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  value: 'Não',
                  onChanged: (val) {
                    setState(() {
                      radioItem = val;
                    });
                  },
                ),
              ),

              Container(
                height: MediaQuery.of(context).size.height * .03,
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

              GestureDetector(
                onTap: () {
                  if (_bloc.txtIdProtocolo.text == "" ||
                      (_bloc.txtData.text == "") ||
                      _bloc.txtData.text.length < 10 ||
                      _bloc.txtLocal.text == "" ||
                      (bairro == "Selecione o Bairro" || bairro == null) ||
                      (tipoNatureza == "Selecione o tipo de Natureza" ||
                          tipoNatureza == null)) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          titleTextStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                          title: Text("EXISTEM CAMPOS A SEREM PREENCHIDOS!"),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text(
                                "Ok",
                                style: TextStyle(
                                    fontSize: sizeTextHeaderSet(context) * 0.85,
                                    color: Colors.black),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    _bloc.cadastrarSolicitante(checkAnonimo);
                    _bloc.cadastrarEndereco();
                    _bloc.cadastrarProtocolo(checkAnonimo, radioItem);
                    CircularProgressIndicator(
                      value: 0.2,
                    );

                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => NavigatorPage(),
                      ),
                    );
                  }
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * .070,
                  width: MediaQuery.of(context).size.width * .40,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(32, 32, 86, 1),
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "EDITAR",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: sizeTextHeaderSet(context) * 1.2,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                height: MediaQuery.of(context).size.height * .08,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
