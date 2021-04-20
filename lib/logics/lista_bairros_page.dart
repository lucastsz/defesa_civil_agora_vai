import 'package:flutter/material.dart';

class DropDownList extends StatefulWidget {
  @override
  _DropDownListState createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {
  String dropdownValue = "Selecione";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          DropdownButton<String>(
            isDense: false,
            dropdownColor: Colors.white,
            icon: Icon(
              Icons.arrow_drop_down_outlined,
              color: Color.fromRGBO(203, 79, 36, 1),
              size: 30,
            ),
            value: dropdownValue,
            onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue;
              });
            },
            items: <String>[
              "Selecione",
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
                child: Text(
                  value,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
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
