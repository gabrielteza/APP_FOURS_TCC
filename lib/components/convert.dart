import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';

const request =
    "https://api.hgbrasil.com/finance?format=json-cors&key=70813c46";

Future<Map<String, dynamic>> getData() async {
  http.Response response = await http.get(Uri.parse(request));
  return json.decode(response.body);
}

class Converter extends StatefulWidget {
  @override
  _ConverterState createState() => _ConverterState();
}

class _ConverterState extends State<Converter> {
  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();

  double dolar = 0.0;
  double euro = 0.0;

  @override
  void initState() {
    super.initState();
    getData().then((data) {
      setState(() {
        dolar = data["results"]["currencies"]["USD"]["buy"];
        euro = data["results"]["currencies"]["EUR"]["buy"];
      });
    });
  }

  void _realChanged(String text) {
    double real = double.tryParse(text) ?? 0.0;
    dolarController.text = (real / dolar).toStringAsFixed(2);
    euroController.text = (real / euro).toStringAsFixed(2);
  }

  void _dolarChanged(String text) {
    double dolar = double.tryParse(text) ?? 0.0;
    realController.text = (dolar * this.dolar).toStringAsFixed(2);
    euroController.text = (dolar * this.dolar / euro).toStringAsFixed(2);
  }

  void _euroChanged(String text) {
    double euro = double.tryParse(text) ?? 0.0;
    realController.text = (euro * this.euro).toStringAsFixed(2);
    dolarController.text = (euro * this.euro / dolar).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Conversor"),
        backgroundColor: const Color.fromARGB(255, 100, 23, 145),
        centerTitle: true,
        leading: Icon(Icons.paid_outlined),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
         Padding(
  padding: const EdgeInsets.all(10.0),
),
          
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: buildTextField("Reais", "", realController, _realChanged,),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child:
                buildTextField("Dólares", "", dolarController, _dolarChanged),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: buildTextField("Euros", "", euroController, _euroChanged),
          ),
          Row(
          
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
    backgroundColor: Color.fromARGB(255, 100, 23, 145),
),

                    onPressed: () {
                        
                      getData().then((data) {
                        setState(() {
                          dolar = data["results"]["currencies"]["USD"]["buy"];
                          euro = data["results"]["currencies"]["EUR"]["buy"];
                        });
                      });
                    },
                    child: Text(
                      "Atualizar Dados",
                      style: TextStyle(fontSize: 20.0,),
            
                      
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]
      )
    );
  }
}

Widget buildTextField(
    String label, String prefix, TextEditingController c, Function(String) f) {
  return Container(
    margin: EdgeInsets.all(4.0), 
    padding: EdgeInsets.all(4.0), 
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(
        color: Colors.white, 
      ),
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: TextField(
      controller: c,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.black), 
        border: InputBorder.none,
        prefixText: prefix,
      ),
      style: TextStyle(color: Colors.black), 
      onChanged: f,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}$')),
      ],
    ),
  );
}

void main() {
  runApp(MaterialApp(
    home: Converter(),
    theme: ThemeData(
      hintColor: const Color.fromARGB(255, 255, 255, 255),
      primaryColor: Colors.white,
    ),
  ));
}
