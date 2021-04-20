// import 'package:defesa_civil_protocolo_app/pages/listaBairros.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
// import 'homeNav.dart';
import 'navigator_page.dart';

//------------------------------------------------------------------------------
//OK

double sizeTextHeaderSet(context) {
  double unitHeightValue = MediaQuery.of(context).size.height * 0.0115;
  double customSize = 2.5;
  return customSize * unitHeightValue;
}

// var datemaskFormatter = new MaskTextInputFormatter(
//     mask: '##/##/####', filter: {"#": RegExp(r'[0-9]')});

class ConsultaProtocoloPage extends StatelessWidget {
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
                  keyboardType: TextInputType.datetime,
                  // inputFormatters: [datemaskFormatter],
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
                child: ListaBairrosConsulta(),
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
                child: ListaNatureza(),
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

class ListaNatureza extends StatefulWidget {
  @override
  _ListaNaturezaState createState() => _ListaNaturezaState();
}

class _ListaNaturezaState extends State<ListaNatureza> {
  String dropdownValue = "Selecione a Natureza";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .085,
      width: MediaQuery.of(context).size.width * .74,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black38),
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton<String>(
            iconSize: MediaQuery.of(context).size.height * .07,
            isDense: true,
            iconEnabledColor: Color.fromRGBO(203, 79, 36, 1),
            dropdownColor: Colors.white,
            icon: Icon(
              Icons.arrow_drop_down,
              size: MediaQuery.of(context).size.height * .07,
            ),
            value: dropdownValue,
            onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue;
              });
            },
            items: <String>[
              'Selecione a Natureza',
              'Alagamento/Enchente/Inundação',
              'Desabamento',
              'Deslizamento',
              'Risco de Desabamento',
              'Risco de Deslizamento',
              'Retirada de Parede',
              'Risco Explosivo/Químico/Radioativo/Biológico',
              'Outro',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Container(
                  width: MediaQuery.of(context).size.width * .55,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text(
                      value,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: sizeTextHeaderSet(context),
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class ListaBairrosConsulta extends StatefulWidget {
  @override
  _ListaBairrosConsultaState createState() => _ListaBairrosConsultaState();
}

class _ListaBairrosConsultaState extends State<ListaBairrosConsulta> {
  String dropdownValue = "Selecione o Bairro";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .085,
      width: MediaQuery.of(context).size.width * .74,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black38),
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton<String>(
            iconSize: MediaQuery.of(context).size.height * .07,
            isDense: true,
            iconEnabledColor: Color.fromRGBO(203, 79, 36, 1),
            dropdownColor: Colors.white,
            icon: Icon(
              Icons.arrow_drop_down,
              size: MediaQuery.of(context).size.height * .07,
            ),
            value: dropdownValue,
            onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue;
              });
            },
            items: <String>[
              "Selecione o Bairro",
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
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Container(
                  width: MediaQuery.of(context).size.width * .55,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text(
                      value,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: sizeTextHeaderSet(context),
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
