// import 'package:defesa_civil_protocolo_app/pages/listaBairros.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'consultar_protocolo_solicitante_page.dart';
import 'navigator_page.dart';

double sizeTextHeaderSet(context) {
  double unitHeightValue = MediaQuery.of(context).size.height * 0.0115;
  double customSize = 2.5;
  return customSize * unitHeightValue;
}

var datemaskFormatter = new MaskTextInputFormatter(
    mask: '##/##/####', filter: {"#": RegExp(r'[0-9]')});

class ConsultaProtocoloPage extends StatefulWidget {
  @override
  _ConsultaProtocoloPageState createState() => _ConsultaProtocoloPageState();
}

class _ConsultaProtocoloPageState extends State<ConsultaProtocoloPage> {
  ConsultarProcoloSolicitantePage _bloc = new ConsultarProcoloSolicitantePage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(203, 79, 36, 1),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Consultar Protocolo",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * .035,
              ),
              Text(
                "Digite em um dos campos abaixo:",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: sizeTextHeaderSet(context),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .035,
              ),
              Container(
                height: MediaQuery.of(context).size.height * .085,
                width: MediaQuery.of(context).size.width * .74,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: TextField(
                  // controller: _bloc.txtPesquisa,
                  keyboardType: TextInputType.datetime,
                  inputFormatters: [datemaskFormatter],
                  style: TextStyle(fontSize: sizeTextHeaderSet(context)),
                  decoration: InputDecoration(
                      hoverColor: Colors.black,
                      prefixIcon: Icon(
                        Icons.calendar_today_rounded,
                        color: Color.fromRGBO(203, 79, 36, 1),
                      ),
                      hintText: 'Data',
                      hintStyle: TextStyle(
                        height: 3.10,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .035,
              ),
              Container(
                height: MediaQuery.of(context).size.height * .085,
                width: MediaQuery.of(context).size.width * .74,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: TextField(
                  textCapitalization: TextCapitalization.characters,
                  inputFormatters: [LengthLimitingTextInputFormatter(8)],
                  style: TextStyle(fontSize: sizeTextHeaderSet(context)),
                  decoration: InputDecoration(
                      hoverColor: Colors.black,
                      prefixIcon: Icon(
                        Icons.source_rounded,
                        color: Color.fromRGBO(203, 79, 36, 1),
                      ),
                      hintText: 'Id do protocolo',
                      hintStyle: TextStyle(
                        height: 3.10,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .035,
              ),
              Container(
                height: MediaQuery.of(context).size.height * .085,
                width: MediaQuery.of(context).size.width * .74,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: TextField(
                  keyboardType: TextInputType.name,
                  style: TextStyle(fontSize: sizeTextHeaderSet(context)),
                  decoration: InputDecoration(
                    hoverColor: Colors.black,
                    prefixIcon: Icon(
                      Icons.person_rounded,
                      color: Color.fromRGBO(203, 79, 36, 1),
                    ),
                    hintText: 'Nome do solicitante',
                    hintStyle: TextStyle(
                      height: 3.10,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .035,
              ),
              Container(
                height: MediaQuery.of(context).size.height * .085,
                width: MediaQuery.of(context).size.width * .74,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                // child: ListaBairrosConsulta(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .035,
              ),
              Container(
                height: MediaQuery.of(context).size.height * .085,
                width: MediaQuery.of(context).size.width * .74,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                // child: ListaNatureza(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .05,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => NavigatorPage(),
                    ),
                  );
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * .070,
                  width: MediaQuery.of(context).size.width * .35,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(32, 32, 86, 1),
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "PESQUISAR",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: sizeTextHeaderSet(context),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
