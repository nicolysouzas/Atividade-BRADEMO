import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MapaPage(),
    );
  }
}

class MapaPage extends StatefulWidget {
  const MapaPage({super.key});

  @override
  State<MapaPage> createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  GoogleMapController? mapController;

  LatLng _posicaoInicial =
      const LatLng(-23.550520, -46.633308); // São Paulo

  Marker? _marcador;

  @override
  void initState() {
    super.initState();
    _obterLocalizacao();
  }

  Future<void> _obterLocalizacao() async {
    bool servicoHabilitado;
    LocationPermission permissao;

    servicoHabilitado =
        await Geolocator.isLocationServiceEnabled();

    if (!servicoHabilitado) {
      return;
    }

    permissao = await Geolocator.checkPermission();

    if (permissao == LocationPermission.denied) {
      permissao =
          await Geolocator.requestPermission();
    }

    Position posicao =
        await Geolocator.getCurrentPosition();

    LatLng localAtual =
        LatLng(posicao.latitude, posicao.longitude);

    setState(() {
      _posicaoInicial = localAtual;

      _marcador = Marker(
        markerId: const MarkerId('eu'),
        position: localAtual,
        infoWindow: const InfoWindow(
          title: 'Minha localização',
        ),
      );
    });

    mapController?.animateCamera(
      CameraUpdate.newLatLngZoom(
        localAtual,
        16,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha Geolocalização'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _posicaoInicial,
          zoom: 14,
        ),
        onMapCreated: (controller) {
          mapController = controller;
        },
        markers:
            _marcador != null
                ? {_marcador!}
                : {},
        myLocationEnabled: true,
      ),
    );
  }
}