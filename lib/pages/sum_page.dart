import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SumPage extends StatefulWidget {

  double soma;
  SumPage(this.soma, {super.key});

  @override
  State<SumPage> createState() => _SumPageState();
}

class _SumPageState extends State<SumPage> {

  List<FaixaModel> faixas = [
    FaixaModel(nome: 'Magreza', percentual: 18.5, cor:  Colors.purple.shade200) ,
    FaixaModel(nome: 'Normal', percentual: 24.9, cor: Colors.purple.shade300),
    FaixaModel(nome: 'Sobrepeso', percentual: 29.9, cor: Colors.purple.shade600),
    FaixaModel(nome: 'Obesidade', percentual: 30.0, cor: Colors.purple.shade800),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora IMC'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 100, 23, 145),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: (){
            setState(() {
              Navigator.of(context).pop();
            });
          }
        ),
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const SizedBox(height: 50),
          SizedBox(
            child: Column(children: [
              SingleChildScrollView(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: faixas.length,
                  itemBuilder: (context, index) {
                    return FaixaCard(faixa: faixas[index]);
                    },
                ),
              ),
              const SizedBox(height: 50),
              Text(
                widget.soma.toStringAsFixed(2),
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    color: Colors.white),
              ),
            ]),
          )
        ],
      ),
    );
  }
}

class FaixaModel {
  final String nome;
  final double percentual;
  final Color cor;

  FaixaModel({required this.nome, required this.percentual, required this.cor});
}

class FaixaCard extends StatelessWidget {
  const FaixaCard({Key? key, required this.faixa}) : super(key: key);

  final FaixaModel faixa;
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 1,
        color: faixa.cor,
        child: ListTile(
          title: Text(
            faixa.nome,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),
          ),
          trailing: Padding(
              padding: EdgeInsets.only(right: 40),
              child: Text(
                '< ${faixa.percentual.toString()}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
              )),
        ));
  }
}
