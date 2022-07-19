import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:site_dr_paula/config.dart';

class maps extends StatefulWidget {
  const maps({Key? key}) : super(key: key);

  @override
  State<maps> createState() => _mapsState();
}

// ignore: camel_case_types
class _mapsState extends State<maps> {
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
                markers: Set<Marker>.of(_markers),
                mapType: MapType.normal,
                initialCameraPosition: const CameraPosition(
                    target: LatLng(-12.974347285704514, -38.513044658283896),
                    zoom: 13),
              ),
            )
          : const CircularProgressIndicator(),
    );
  }
}
