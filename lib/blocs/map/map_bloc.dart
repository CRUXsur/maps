import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart' show GoogleMapController, LatLng;
import 'package:maps_app/themes/themes.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  GoogleMapController? _mapController;

  MapBloc() : super(const MapState()) {
    //on<OnMapInitializedEvent>((event, emit) => emit(state.copyWith(isMapInitialized: true)));
    on<OnMapInitializedEvent>(_onInitMap);
  }

  void _onInitMap(OnMapInitializedEvent event, Emitter<MapState> emit) {
    _mapController = event.controller;
    //*_mapController. aqui tengo muchas cosas.....
    //
    //*cambio el theme: de uber from https://snazzymaps.com/style/90982/uber-2017
    _mapController!.setMapStyle(jsonEncode(uberMapTheme));

    emit(state.copyWith(isMapInitialized: true));
  }
}
