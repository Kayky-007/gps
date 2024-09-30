import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class Mapa extends StatefulWidget {
  const Mapa({super.key, required this.latitude, required this.longitude});
  final double latitude, longitude;
  @override
  State<Mapa> createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        initialCenter: LatLng(widget.latitude,
            widget.longitude), // Centralize o mapa na localização
        initialZoom: 9.2,
      ),
      children: [
        TileLayer(
          urlTemplate:
              'https://tile.openstreetmap.org/{z}/{x}/{y}.png', // Servidor
        ),
      ],
    );
  }
}
