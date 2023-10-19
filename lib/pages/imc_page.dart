import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_register/pages/sum_page.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class ImcPage extends StatefulWidget {

  @override
  State<ImcPage> createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> {

  late double cm;
  late double kg;
  late double soma;

  @override
  Widget build(BuildContext context) {
     double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora IMC'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 100, 23, 145),
        leading: Icon(Icons.scale),
      ),
      backgroundColor: Colors.black,
      body: SizedBox(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SleekCircularSlider(
                    initialValue: 0,
                    min: 0,
                    max: 200,
                    onChange: (value) {
                      setState(() {
                        cm = value;
                        cm = cm/100;
                      });
                    },
                    innerWidget: (percentage) {
                      return Center(
                        child: Text(
                          '${percentage.toInt()} cm',
                          style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255)
                          ),
                        ),
                      );
                    },
                    appearance: CircularSliderAppearance(
                      customColors: CustomSliderColors(
                        progressBarColors: [
                          Colors.purple,
                          Colors.deepPurple,
                        ],
                      trackColor: Color.fromARGB(255, 255, 255, 255),
                      hideShadow: true
                    ),
                    size: MediaQuery.of(context).size.width * 0.5),
                  ),
                  SleekCircularSlider(
                    initialValue: 0,
                    min: 0,
                    max: 200.0,
                    onChange: (value) {
                      setState(() {
                        kg = value;
                      });
                    },
                    innerWidget: (kg) {
                      return Center(
                        child: Text(
                          '${kg.toStringAsFixed(2)} kg',
                          style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 255, 255)
                          ),
                        ),
                      );
                    },
                    appearance: CircularSliderAppearance(
                        customColors: CustomSliderColors(
                            progressBarColors: [
                              Colors.purple,
                              Colors.deepPurple,
                            ],
                            trackColor: Colors.white,
                            hideShadow: true
                        ),
                        size: MediaQuery.of(context).size.width * 0.5),
                  )
                ],
              ),
            ),
            const SizedBox(height: 100),
            ElevatedButton(
              onPressed: (){
                setState(() {
                    soma = kg / (cm * cm);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SumPage(soma)));
                  });
                },
               child: Text('Calcular', style: TextStyle(fontSize: 0.04 * screenWidth)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 100, 23, 145),
                minimumSize: Size(140, 30),
              ),
          
            ),/*
            ElevatedButton(  
                onPressed: (){ 
                  setState(() {
                    soma = kg / (cm * cm);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SumPage(soma)));
                  });
                },
                child: const Text(
                    'Calcular',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                )
                
            ),
            */
          ],
        ),
      ),
    );
  }
}
