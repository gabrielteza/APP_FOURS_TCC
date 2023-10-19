import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:geocoding/geocoding.dart';

import 'package:geolocator/geolocator.dart';
import 'package:login_register/components/convert.dart';
import 'package:login_register/pages/area.dart';
import 'package:login_register/pages/auth.dart';
import 'package:login_register/pages/discont.dart';
import 'package:login_register/pages/imc_page.dart';
import 'package:login_register/pages/massa.dart';
import 'package:login_register/pages/porcent.dart';
import 'package:login_register/pages/temp.dart';
import 'package:login_register/pages/tempo.dart';
import 'package:login_register/pages/velocity.dart';

import 'package:url_launcher/url_launcher.dart';

import 'Resgister_page.dart';
import 'fist_page.dart';
import 'tempo.dart';

class SmsPage extends StatefulWidget {
  const SmsPage({super.key});

  @override
  State<SmsPage> createState() => _SmsPageState();
}

class _SmsPageState extends State<SmsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        )),
        backgroundColor: const Color.fromARGB(255, 100, 23, 145),
      ),
      backgroundColor: Colors.black,
      body: GridView.count(
        crossAxisCount: 3,
        children: [
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => DiscountCalculatorApp(),
                  ),
                );
              },
              child: Column(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                DiscountCalculatorApp(),
                          ),
                        );
                      },
                      color: Colors.white,
                      icon: const Icon(Icons.discount_outlined)),
                  const Text(
                    "Desconto",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              )),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) =>
                        TemperatureConverterApp(),
                  ),
                );
              },
              child: Column(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                TemperatureConverterApp(),
                          ),
                        );
                      },
                      color: Colors.white,
                      icon: const Icon(Icons.thermostat_auto_outlined)),
                  const Text(
                    "Temperatura",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              )),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => AreaPage(),
                  ),
                );
              },
              child: Column(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => AreaPage(),
                          ),
                        );
                      },
                      color: Colors.white,
                      icon: const Icon(Icons.square_foot)),
                  const Text(
                    "Área",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              )),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => TimeConverter(),
                  ),
                );
              },
              child: Column(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => TimeConverter(),
                          ),
                        );
                      },
                      color: Colors.white,
                      icon: const Icon(Icons.watch_later_outlined)),
                  const Text(
                    "Tempo",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              )),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => SpeedConverter(),
                  ),
                );
              },
              child: Column(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => SpeedConverter(),
                          ),
                        );
                      },
                      color: Colors.white,
                      icon: const Icon(Icons.speed)),
                  const Text(
                    "Velocidade",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              )),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => MassaCalculator(),
                  ),
                );
              },
              child: Column(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                MassaCalculator(),
                          ),
                        );
                      },
                      color: Colors.white,
                      icon: const Icon(Icons.balance_sharp)),
                  const Text(
                    "Massa",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              )),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => ImcPage(),
                  ),
                );
              },
              child: Column(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => ImcPage(),
                          ),
                        );
                      },
                      color: Colors.white,
                      icon: const Icon(Icons.scale)),
                  const Text(
                    "IMC",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              )),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) =>
                        PercentageCalculatorApp(),
                  ),
                );
              },
              child: Column(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                PercentageCalculatorApp(),
                          ),
                        );
                      },
                      color: Colors.white,
                      icon: const Icon(Icons.percent_rounded)),
                  const Text(
                    "Porcentagem",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              )),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => Converter(),
                  ),
                );
              },
              child: Column(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => Converter(),
                          ),
                        );
                      },
                      color: Colors.white,
                      icon: const Icon(Icons.paid_outlined)),
                  const Text(
                    "Conversão",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              )),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const FirstPage(),
                  ),
                );
              },
              child: Column(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const AuthPage(),
                          ),
                        );
                      },
                      color: Colors.white,
                      icon: const Icon(Icons.help_outline_outlined)),
                  const Text(
                    "Ajuda",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
