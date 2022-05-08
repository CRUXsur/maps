import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'gps_event.dart';
part 'gps_state.dart';

class GpsBloc extends Bloc<GpsEvent, GpsState> {
  //por defecto no tengo permiso y esta deshabilitado!
  GpsBloc()
      : super(const GpsState(
            isGpsEnabled: false, isGpsPermissionGranted: false)) {
    on<GpsEvent>((event, emit) {});
  }
}
