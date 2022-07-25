import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'config.dart';

class GoogleMaps extends StatefulWidget {
  final List<double> locale;
  const GoogleMaps(this.locale, {Key? key}) : super(key: key);

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
      Marker(
        markerId: const MarkerId("mylocation"),
        position: LatLng(widget.locale[0], widget.locale[1]),
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
          ? SizedBox(
              height: 500,
              width: SiteConfig.screenSize.width,
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
                scrollGesturesEnabled: true,
                markers: Set<Marker>.of(_markers),
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                    target: LatLng(widget.locale[0], widget.locale[1]),
                    zoom: 17),
              ),
            )
          : const CircularProgressIndicator(),
    );
  }
}
