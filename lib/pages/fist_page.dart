import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:login_register/pages/chat_screen.dart';
import 'package:url_launcher/url_launcher.dart';


class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String? _currentAddress;
  Position? _currentPosition;

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'O serviço de localizção está desligado. Por favor ative o serviço')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
        ],
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        )),
        backgroundColor: const Color.fromARGB(255, 100, 23, 145),
      ),
      backgroundColor: Colors.black,
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          TextButton(
              onPressed: (){},
              child: Column(
                children: [
                  IconButton(
                      onPressed:(){ _getCurrentPosition();},
                      color: Colors.white,
                      icon: const Icon(Icons.discount_outlined)),
                  const Text(
                    "Permissão para localização",
                    style: TextStyle(color: Colors.white, fontSize: 15 *1),
                  ),
                ],
              )),
          TextButton(
              onPressed:abrirWhatsApp,
              child: Column(
                children: [
                  IconButton(
                      onPressed: abrirWhatsApp,
                      color: Colors.white,
                      icon: const Icon(Icons.thermostat_auto_outlined)),
                  const Text(
                    "Mensagem automática para whatsapp da Del. da mulher",
                    style: TextStyle(color: Colors.white, fontSize: 15 *1),
                  ),
                ],
              )),
          TextButton(
              onPressed: OpenUrl,
              child: Column(
                children: [
                  IconButton(
                      onPressed: OpenUrl,
                      color: Colors.white,
                      icon: const Icon(Icons.square_foot)),
                  const Text(
                    "Web Denúncia",
                    style: TextStyle(color: Colors.white, fontSize: 15 *1),
                  ),
                ],
              )),
          TextButton(
              onPressed: OpenPage,
              child: Column(
                children: [
                  IconButton(
                      onPressed:OpenPage,
                      color: Colors.white,
                      icon: const Icon(Icons.watch_later_outlined)),
                  const Text(
                    "Página de direito das mulheres",
                    style: TextStyle(color: Colors.white, fontSize: 15 *1),
                  ),
                ],
              )),
         TextButton(
              onPressed: (){Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => ChatScreen(),
                          ),
                        );;},
              child: Column(
                children: [
                  IconButton(
                      onPressed:(){Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => ChatScreen(),
                          ),
                        );;},
                      color: Colors.white,
                      icon: const Icon(Icons.chat)),
                  const Text(
                    "Chat",
                    style: TextStyle(color: Colors.white, fontSize: 15 *1),
                  ),
                ],
              )),
          
        ],
      ),
      
    );
  }

  OpenUrl() async {
    var OpenUrl = 'https://www.webdenuncia.org.br/cidadao/denuncie';

    if (await canLaunchUrl(Uri.parse(OpenUrl))) {
      await launchUrl(Uri.parse(OpenUrl));
    } else {
      throw 'Could not launch $OpenUrl';
    }
  }

  OpenPage() async {
    var OpenPage =
        'https://brasildedireitos.org.br/atualidades/para-assegurar-os-direitos-das-mulheres-precisamos-mudar-mentalidades?utm_source=google&utm_medium=cpc&utm_campaign=direitosdasmulheres&gclid=EAIaIQobChMInfXvkYbfgAMVfVN_AB3X-gWgEAAYAyAAEgIIwvD_BwE';

    if (await canLaunchUrl(Uri.parse(OpenPage))) {
      await launchUrl(Uri.parse(OpenPage));
    } else {
      throw 'Could not launch $OpenPage';
    }
  }

  abrirWhatsApp() async {
    var whatsappUrl =
        "whatsapp://send?phone=16997169650&text=Olá, preciso de ajuda, está é minha localização:  http://www.google.com/maps/place/${_currentPosition?.latitude},${_currentPosition?.longitude}";

    if (await canLaunchUrl(Uri.parse(whatsappUrl))) {
      await launchUrl(Uri.parse(whatsappUrl));
    } else {
      throw 'Could not launch $whatsappUrl';
    }
  }
}
