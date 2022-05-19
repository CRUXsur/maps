import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatelessWidget {
  final LatLng initialLocation;

  const MapView({
    super.key,
    required this.initialLocation,
  });

  @override
  Widget build(BuildContext context) {
    final CameraPosition initialCameraPosition = CameraPosition(
      target: initialLocation,
      zoom: 15,
    );
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: size.height,
      child: GoogleMap(
        initialCameraPosition: initialCameraPosition,
        compassEnabled: false,
        myLocationEnabled: true, //puntito azul , donde estoy...
        zoomControlsEnabled: false, // botones + y -
        myLocationButtonEnabled: false, //regresar al usr a la pos central:NO

        //TODO: Markers
        //TODO: Polylines
        //TODO: Cuando se mueve el mapa
      ),
    );
  }
}
