import 'package:flutter/material.dart';

void main() {
  runApp(DiscountCalculatorApp());
}

class DiscountCalculatorApp extends StatefulWidget {
  @override
  _DiscountCalculatorAppState createState() => _DiscountCalculatorAppState();
}

class _DiscountCalculatorAppState extends State<DiscountCalculatorApp> {
  TextEditingController originalPriceController = TextEditingController();
  TextEditingController discountPercentageController = TextEditingController();

  double discountedPrice = 0.0;

  void calculateDiscount() {
    double originalPrice = double.tryParse(originalPriceController.text) ?? 0.0;
    double discountPercentage =
        double.tryParse(discountPercentageController.text) ?? 0.0;

    if (originalPrice > 0 && discountPercentage >= 0 && discountPercentage <= 100) {
      double discountAmount = (originalPrice * discountPercentage) / 100;
      double newPrice = originalPrice - discountAmount;

      setState(() {
        discountedPrice = newPrice;
      });
    } else {
      setState(() {
        discountedPrice = 0.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calculadora de Desconto'),
          backgroundColor: Color.fromARGB(255, 100, 23, 145),
          leading: Icon(Icons.discount),
        ),
        backgroundColor: Colors.black,
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(0.05 * screenWidth),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: 0.02 * screenHeight),
                Container(
                  margin: EdgeInsets.all(0.01 * screenWidth),
                  padding: EdgeInsets.all(0.01 * screenWidth),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(0.01 * screenWidth),
                  ),
                  child: TextField(
                    controller: originalPriceController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Preço Original',
                      labelStyle: TextStyle(color: Colors.black),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(height: 0.03 * screenHeight),
                Container(
                  margin: EdgeInsets.all(0.01 * screenWidth),
                  padding: EdgeInsets.all(0.01 * screenWidth),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(0.01 * screenWidth),
                  ),
                  child: TextField(
                    controller: discountPercentageController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Percentual de Desconto',
                      labelStyle: TextStyle(color: Colors.black),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(height: 0.02 * screenHeight),
                                ElevatedButton(
                  onPressed: calculateDiscount,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(13.0),
                    child: Center(
                      child: Text(
                        'Calcular',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 100, 23, 145),
                    minimumSize: Size(180, 60),
                  ),
                ),
                SizedBox(height: 30.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Preço com Desconto: R\$${discountedPrice.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
