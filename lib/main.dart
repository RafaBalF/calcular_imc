// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final txtPeso = TextEditingController();
  final txtAltura = TextEditingController();

  double? imc;
  String? mensagem;

  var imagem = 'images/ideal.jpg';

  void calculaImc() {
    var peso = double.parse(txtPeso.text);
    var altura = double.parse(txtAltura.text);

    imc = peso / (altura * altura);

    if (imc! <= 18.4) {
      setState(() => imagem = 'images/abaixo.jpg');
      setState(() => mensagem = 'Abaixo');
    } else if (imc! >= 18.5 && imc! <= 24.9) {
      setState(() => imagem = 'images/ideal.jpg');
      setState(() => mensagem = 'Ideal');
    } else if (imc! >= 25 && imc! < 29.9) {
      setState(() => imagem = 'images/excesso.jpg');
      setState(() => mensagem = 'Excesso');
    } else if (imc! >= 30 && imc! <= 39.9) {
      setState(() => imagem = 'images/obesidade1.jpg');
      setState(() => mensagem = 'Obesidade 1');
    } else if (imc! >= 40) {
      setState(() => imagem = 'images/obesidade2.jpg');
      setState(() => mensagem = 'Obesidade 2');
    }

    setState(() => imc!.toStringAsFixed(2));

    print(imc);
    print(imagem);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cálculo IMC'),
        ),
        body: Column(
          children: [
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  //color: Colors.black12,
                  decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: txtPeso,
                          decoration: InputDecoration(
                              labelText: 'Peso', hintText: 'Em kilos'),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: txtAltura,
                          decoration: InputDecoration(
                              labelText: 'Altura', hintText: 'Em metros'),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () => calculaImc(),
                          child: Text('Calcular'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: imc == null
                  ? Container()
                  : FittedBox(
                      child: Stack(
                        children: [
                          GestureDetector(
                            onDoubleTap: () {
                              setState(() {
                                imc = null;
                              });
                            },
                            child: Padding(  
                              padding: const EdgeInsets.all(15.0),
                              child: Image.asset(imagem),
                            ),
                          ),
                          Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 60.0),
                                child: Text(
                                  '$mensagem peso',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                child: Text(
                                  'IMC: ${imc!.toStringAsFixed(2)}',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          )),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
