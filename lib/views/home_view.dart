// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gps_oncoto/componentes/mapa.dart';
import 'package:gps_oncoto/controller/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController _controller = HomeController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Descubra sua localização?")),
      body: Column(
        children: [
          Visibility(
            visible: _controller.carregando,
            child: CircularProgressIndicator()
            ),
          SizedBox(
            child: Visibility(
              visible: _controller.mapa_visivel,
              child: Mapa(
                latitude: _controller.latitude,
                longitude: _controller.longitude,
              ),
            ),
            width: double.infinity,
            height: 500,
          ),
          Text(_controller.resultado),
          ElevatedButton.icon(
            onPressed: () async {
              setState(() {
                _controller.mapa_visivel = false;
                _controller.carregando = true;
              });
              
              _controller.localizacao = await _controller.obterlocalizacao();
              
              setState(() {
                _controller.carregando = false;
                _controller.resultado =
                    "Latitude: ${_controller.localizacao!.latitude}\nLongitude: ${_controller.localizacao!.longitude}\nAcuracia: ${_controller.localizacao!.accuracy}";
                _controller.latitude = _controller.localizacao!.latitude;
                _controller.longitude = _controller.localizacao!.longitude;
                _controller.mapa_visivel = true;
              });
            },
            label: Text('Cadê eu'),
            icon: Icon(Icons.question_mark),
            iconAlignment: IconAlignment.end,
          )
        ],
      ),
    );
  }
}
