// import 'package:defesa_civil_protocolo_app/pages/homeReformado.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:defesa_civil_agora_vai/banco/banco.dart';
import 'package:defesa_civil_agora_vai/logics/login_bloc.dart';
import 'package:defesa_civil_agora_vai/view/home_page.dart';
import 'package:defesa_civil_agora_vai/view/teste_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'consultar_protocolo.dart';
import 'consultar_protocolo_solicitante.dart';
import 'navigator_page.dart';

// import 'consultar_protocolo.dart';
// import 'consultar_protocolo_solicitante.dart';
// import 'homeNav.dart';

class Login_page extends StatefulWidget {
  @override
  _Login_pageState createState() => _Login_pageState();
}

Widget Seta = Icon(
  Icons.keyboard_arrow_up,
  size: 50,
  color: Colors.white,
);
TextEditingController _matricula = TextEditingController();
TextEditingController _senha = TextEditingController();

class _Login_pageState extends State<Login_page> {
  double sizeTextHeaderSet(context) {
    double unitHeightValue = MediaQuery.of(context).size.height * 0.0115;
    double customSize = 2.5;
    return customSize * unitHeightValue;
  }

  LoginBloc bloc = LoginBloc();
  double altura = 100;
  Widget escolhe;

  @override
  Widget build(BuildContext context) {
    LoginBloc _bloc = new LoginBloc();

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            //LOGOMARCA
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .09,
                ),
                Container(
                  alignment: Alignment.topCenter,
                  width: MediaQuery.of(context).size.width * .45,
                  child: Image.asset(
                    'assets/images/logo.png',
                    alignment: Alignment.center,
                  ),
                  // child: Image.asset(
                  //   'assets/images/logo.png',
                  //   alignment: Alignment.center,
                  // ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * .46,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  ConsultarProcoloSolicitantePage(),
                            ),
                          );
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * .085,
                          width: MediaQuery.of(context).size.width * .74,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(203, 79, 36, 1),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "CONSULTAR PROTOCOLO",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: sizeTextHeaderSet(context),
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.search_rounded,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            //BOTÃO PESQUISAR

            //ROLAGEM ACESSAR SISTEMA

            Positioned(
              bottom: 0,
              child: GestureDetector(
                onTap: () {
                  if (altura == 100) {
                    altura = MediaQuery.of(context).size.height * .55;
                  } else {
                    altura = 100;
                  }
                  setState(() {
                    if (altura == 100) {
                      Seta = Icon(
                        Icons.keyboard_arrow_up_rounded,
                        size: 50,
                        color: Colors.white,
                      );
                    } else {
                      Seta = Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 50,
                        color: Colors.white,
                      );
                    }
                  });
                },
                child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOutBack,
                    height: altura,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(203, 79, 36, 1),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: _buildLogin(context, _bloc)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ConsultaProtocoloPageSolicitantePage {}

Widget _buildLogin(context, LoginBloc bloc) {
  return SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height * .01,
        ),
        Seta,
        Text(
          "Acessar Sistema",
          style: TextStyle(
            fontSize: sizeTextHeaderSet(context),
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .045,
        ),
        Container(
          height: MediaQuery.of(context).size.height * .085,
          width: MediaQuery.of(context).size.width * .70,
          decoration: BoxDecoration(
              color: Colors.grey[300], borderRadius: BorderRadius.circular(25)),
          child: TextField(
            controller: _matricula,
            inputFormatters: [LengthLimitingTextInputFormatter(6)],
            style: TextStyle(fontSize: sizeTextHeaderSet(context)),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                hoverColor: Colors.black,
                prefixIcon: Icon(
                  Icons.person,
                  color: Color.fromRGBO(203, 79, 36, 1),
                ),
                hintText: 'Matrícula',
                hintStyle: TextStyle(
                  height: 3.10,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25))),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          height: MediaQuery.of(context).size.height * .085,
          width: MediaQuery.of(context).size.width * .70,
          decoration: BoxDecoration(
              color: Colors.grey[300], borderRadius: BorderRadius.circular(25)),
          child: TextField(
            controller: _senha,
            inputFormatters: [LengthLimitingTextInputFormatter(10)],
            obscureText: true,
            style: TextStyle(
              fontSize: sizeTextHeaderSet(context),
            ),
            decoration: InputDecoration(
                hoverColor: Colors.black,
                prefixIcon: Icon(
                  Icons.keyboard,
                  color: Color.fromRGBO(203, 79, 36, 1),
                ),
                hintText: 'Senha',
                hintStyle: TextStyle(
                  height: 3.10,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25))),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .06,
        ),
        GestureDetector(
          onTap: () async {
            if (bloc.txtSenha.text == "" || bloc.txtMatricula.text == "") {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                    title: Text("USUÁRIO OU SENHA INCORRETO(S)"),
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
            }
            bloc.txtMatricula = _matricula;
            bloc.txtSenha = _senha;
            Banco _banco = new Banco();
            QuerySnapshot querySnapshot = await _banco.db
                .collection("usuarios")
                .where("matricula",
                    isEqualTo: bloc.txtMatricula.text.toString())
                .get();
            for (DocumentSnapshot item in querySnapshot.docs) {
              var dados = item.data();
              print(
                  "Dados exibicao: ${dados["nome"]} idade: ${dados["matricula"]}");
              if (dados["senha"] == bloc.txtSenha.text.toString()) {
                _senha.clear();
                _matricula.clear();
                print("Senha confere");
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => NavigatorPage(),
                  ),
                );
              } else {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      titleTextStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                      title: Text("USUÁRIO OU SENHA INCORRETO(S)"),
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
              }
            }
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
                  "ENTRAR",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}

// Widget _buildConta(context, LoginBloc bloc) {
//   double sizeTextHeaderSet(context) {
//     double unitHeightValue = MediaQuery.of(context).size.height * 0.0115;
//     double customSize = 2.5;
//     return customSize * unitHeightValue;
//   }

//   return SingleChildScrollView(
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         SizedBox(
//           height: MediaQuery.of(context).size.height * .01,
//         ),
//         Seta,
//         Text(
//           "Acessar Sistema",
//           style: TextStyle(
//             fontSize: sizeTextHeaderSet(context),
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * .045,
//         ),
//         Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               height: MediaQuery.of(context).size.height * .085,
//               width: MediaQuery.of(context).size.width * .70,
//               decoration: BoxDecoration(
//                   color: Colors.grey[300],
//                   borderRadius: BorderRadius.circular(25)),
//               child: TextField(
//                 controller: bloc.txtMatricula,
//                 inputFormatters: [LengthLimitingTextInputFormatter(6)],
//                 style: TextStyle(fontSize: sizeTextHeaderSet(context)),
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(
//                     hoverColor: Colors.black,
//                     prefixIcon: Icon(
//                       Icons.person,
//                       color: Color.fromRGBO(203, 79, 36, 1),
//                     ),
//                     hintText: 'Matrícula',
//                     hintStyle: TextStyle(
//                       height: 3.10,
//                     ),
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(25))),
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * .02,
//             ),
//             Container(
//               height: MediaQuery.of(context).size.height * .085,
//               width: MediaQuery.of(context).size.width * .70,
//               decoration: BoxDecoration(
//                   color: Colors.grey[300],
//                   borderRadius: BorderRadius.circular(25)),
//               child: TextField(
//                 controller: bloc.txtSenha,
//                 inputFormatters: [LengthLimitingTextInputFormatter(10)],
//                 obscureText: true,
//                 style: TextStyle(
//                   fontSize: sizeTextHeaderSet(context),
//                 ),
//                 decoration: InputDecoration(
//                     hoverColor: Colors.black,
//                     prefixIcon: Icon(
//                       Icons.keyboard,
//                       color: Color.fromRGBO(203, 79, 36, 1),
//                     ),
//                     hintText: 'Senha',
//                     hintStyle: TextStyle(
//                       height: 3.10,
//                     ),
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(25))),
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * .05,
//             ),
//             GestureDetector(
//               onTap: () {
//                 // Navigator.of(context).push(
//                 //   MaterialPageRoute(
//                 //     builder: (context) => HomeScreen(),
//                 //   ),
//                 // );
//               },
//               child: GestureDetector(
//                 onTap: () => bloc.recuperaEdit(),
//                 child: Container(
//                   height: MediaQuery.of(context).size.height * .070,
//                   width: MediaQuery.of(context).size.width * .35,
//                   decoration: BoxDecoration(
//                       color: Color.fromRGBO(32, 32, 86, 1),
//                       borderRadius: BorderRadius.circular(15)),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "ENTRAR",
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: sizeTextHeaderSet(context),
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ],
//     ),
//   );
// }
