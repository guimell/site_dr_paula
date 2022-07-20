import 'package:flutter/material.dart';
import 'package:site_dr_paula/config.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMaps extends StatefulWidget {
  const GoogleMaps({Key? key}) : super(key: key);

  @override
  State<GoogleMaps> createState() => _GoogleMapsState();
}

class _GoogleMapsState extends State<GoogleMaps> {
  late GoogleMapController mapscontroller;
  final List<Marker> _markers = [];
  bool showmaps = true;
  @override
  void initState() {
    super.initState();
    _markers.add(
      const Marker(
        markerId: MarkerId("mylocation"),
        position: LatLng(-12.974347285704514, -38.513044658283896),
      ),
    );
    if (_markers.isEmpty) {
      setState(
        () {
          showmaps = true;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: showmaps
          ? Container(
              height: 500,
              width: SiteConfig.screenWidth,
              child: GoogleMap(
                onMapCreated: (controller) {
                  setState(
                    () {
                      mapscontroller = controller;
                    },
                  );
                },
                zoomControlsEnabled: true,
                zoomGesturesEnabled: false,
                markers: Set<Marker>.of(_markers),
                mapType: MapType.normal,
                initialCameraPosition: const CameraPosition(
                    target: LatLng(-12.974347285704514, -38.513044658283896),
                    zoom: 17),
              ),
            )
          : const CircularProgressIndicator(),
    );
  }
}
