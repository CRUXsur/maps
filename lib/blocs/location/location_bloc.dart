import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  //! este emite valores de posiciones
  StreamSubscription<Position>? positionStream;

  //*ya no tenemos LocationInitial(), solo tenemos LocationState
  //*LocationBloc() : super(LocationInitial()) {
  LocationBloc() : super(const LocationState()) {
    on<LocationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  //?creo dos metodos, para seguir la ubicacion del usuario

  //? me obtiene la posicion actual de usuario
  Future getCurrentPosition() async {
    final position = await Geolocator.getCurrentPosition();
    print('Position: $position');
    //TODO: retornar un oobjeto de tipo LatLng de google maps
  }

  //?empezar a darle seguimiento al usuario
  void startFollowingUser() {
    print('startFollowingUser');
    positionStream = Geolocator.getPositionStream().listen((event) {
      final position = event;
      print('Position: $position');
    });
  }

  void stopFollowingUser() {
    positionStream?.cancel();
    print('stopFollowingUser');
  }

  //! cuando hacemos el close del bloc vamos a mandar a llamar
  //! a nuestro positionStream.cancel().....
  @override
  Future<void> close() {
    stopFollowingUser();
    return super.close();
  }
}
