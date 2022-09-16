// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController txtAlturaCtrl = TextEditingController();

  var txtPesoCtrl = TextEditingController();

  String imageImc = "images/normal.jpg";
  double imc = 0;
  void calculaImc() {
    var altura = double.parse(txtAlturaCtrl.text);
    var peso = double.parse(txtPesoCtrl.text);
    // print(altura);
    // print(peso);

    imc = peso / (altura * altura);

    if (imc < 18.5)
      imageImc = "images/magreza.jpg";
    else if (imc < 25)
      imageImc = "images/normal.jpg";
    else if (imc < 30)
      imageImc = "images/excesso.jpg";
    else if (imc < 35)
      imageImc = "images/obesidade.jpg";
    else
      imageImc = "images/obesidade2.jpg";

    setState(() {});

    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.yellow, scaffoldBackgroundColor: Colors.white),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('IMC'),
        ),
        body: Column(
          children: [
            Flexible(
              child: Container(
                margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                //color: Colors.blue,
                child: Column(
                  children: [
                    TextField(
                      controller: txtAlturaCtrl,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Altura',
                        labelText: 'Altura',
                      ),
                    ),
                    TextField(
                      controller: txtPesoCtrl,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Peso',
                        labelText: 'Peso',
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      width: double.infinity,
                      child: ElevatedButton(
                        child: Text("Calcular IMC"),
                        //onPressed: () => calculaImc(), --se tiver apenas um metodos trocar {} por => se retorno e parametros forem iguais faca que nem na linha dee baixo
                        onPressed: calculaImc,
                      ),
                    ),
                    Text(imc.toStringAsFixed(2)),
                  ],
                ),
              ),
            ),
            Flexible(
              //flex: 3,
              child: Container(
                child: Center(
                  child: Image.asset(
                    imageImc,
                    scale: 0.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
