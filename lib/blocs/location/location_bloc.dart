import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  //*ya no tenemos LocationInitial(), solo tenemos LocationState
  //*LocationBloc() : super(LocationInitial()) {
  LocationBloc() : super(const LocationState()) {
    on<LocationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
