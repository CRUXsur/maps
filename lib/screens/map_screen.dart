import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps_app/blocs/blocs.dart';

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
    return const Scaffold(
      body: Center(
        child: Text('MapScreen'),
      ),
    );
  }
}
