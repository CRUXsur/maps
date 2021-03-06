import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:maps_app/blocs/blocs.dart';
import 'package:maps_app/views/views.dart';

//? convierto de statelesws a statefulw,
//? mas que todo porque quiero tener el initState
//? que solo se dispara una vez cuando este widget se
//? construye y cuando
class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  //!inicializo
  late LocationBloc locationBloc;

  @override
  void initState() {
    super.initState();

    //? uso este initstate, para tener acceso a mi bloc location
    //locationBloc.getCurrentPosition();
    //!final locationBloc = BlocProvider.of<LocationBloc>(context);
    locationBloc = BlocProvider.of<LocationBloc>(context);
    locationBloc.startFollowingUser();
  }

  @override
  void dispose() {
    //!ya no necesito esta linea, las tengo arriba
    //!final locationBloc = BlocProvider.of<LocationBloc>(context);
    locationBloc.stopFollowingUser();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<LocationBloc, LocationState>(
      builder: (context, state) {
        //si no tenemos inguna ubicacion regresamos...
        if (state.lastKnownLocation == null) {
          return const Center(child: Text('Espere por favor...'));
        }
        //
        // return Center(
        //   child: Text(
        //       '${state.lastKnownLocation!.latitude},${state.lastKnownLocation!.longitude}'),
        // );
        //
        // final CameraPosition initialCameraPosition = CameraPosition(
        //   target: state.lastKnownLocation!,
        //   zoom: 15,
        // );
        //return GoogleMap(initialCameraPosition: initialCameraPosition);
        return SingleChildScrollView(
          child: Stack(
            children: [
              MapView(initialLocation: state.lastKnownLocation!),
              // TODO: botones y mas cosas!........
            ],
          ),
        );
      },
    ));
  }
}
