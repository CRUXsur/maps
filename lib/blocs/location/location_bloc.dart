import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  //! este emite valores de posiciones
  StreamSubscription<Position>? positionStream;

  //*ya no tenemos LocationInitial(), solo tenemos LocationState
  //*LocationBloc() : super(LocationInitial()) {
  LocationBloc() : super(const LocationState()) {
    // on<LocationEvent>((event, emit) {
    //   // TODO: implement event handler
    // });
    //!cuando yo recibo un <OnNewUserLocationEvent>
    on<OnNewUserLocationEvent>((event, emit) {
      emit(
        state.copyWith(
          //!lo primero que vamos a cambiar en nuuestro estado
          //!es nuestro lastKnownLocation: y tb la historia
          //!myLocatioHistory
          lastKnownLocation: event.newLocation,
          myLocationHistory: [...state.myLocationHistory, event.newLocation],
        ),
      );
    });
  }

  //?creo dos metodos, para seguir la ubicacion del usuario

  //? me obtiene la posicion actual de usuario
  Future getCurrentPosition() async {
    final position = await Geolocator.getCurrentPosition();
    //print('Position: $position');
    //DONE: retornar un oobjeto de tipo LatLng de google maps
    add(OnNewUserLocationEvent(LatLng(position.latitude, position.longitude)));
  }

  //?empezar a darle seguimiento al usuario
  void startFollowingUser() {
    //print('startFollowingUser');
    positionStream = Geolocator.getPositionStream().listen((event) {
      final position = event;
      //print('Position: $position');
      //!aqui lo disparo mi evento.......
      //!mandandole la latitud y la longitud
      //!qu elo tengo en position
      add(OnNewUserLocationEvent(
          LatLng(position.latitude, position.longitude)));
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
