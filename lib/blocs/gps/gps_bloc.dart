import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

part 'gps_event.dart';
part 'gps_state.dart';

class GpsBloc extends Bloc<GpsEvent, GpsState> {
  //por defecto no tengo permiso y esta deshabilitado!
  GpsBloc()
      : super(const GpsState(
            isGpsEnabled: false, isGpsPermissionGranted: false)) {
    //cuando recibo ese evento, yo emito un nuevo estado
    //en funcion de flecha
    on<GpsAndPermissionEvent>(
      (event, emit) => emit(state.copyWith(
        isGpsEnabled: event.isGpsEnabled,
        isGpsPermissionGranted: event.isGpsPermissionGranted,
      )),
    );

    //lo ponemos en el constructor
    _init();
  }

  //me creo unos metodos que me permitan inicializar el servicio
  //o inicializar el stream de informacion que va a venir
  //proviniente del geolocator

  //inicializacion:
  Future<void> _init() async {
    //
    final isEnabled = await _checkGpsStatus();
    print('isEnabled: $isEnabled');
  }

  //tenemos un listener que esta pendiente de cualquier cambio
  //del servicio de GPS; pero es buena practica, que cuando se haga
  //un listener, tenemos que limpiar ese listener, aunque este servicio
  //o este bloc, nunca se va a cancelar, siempre esta pendiente de toda
  //aplicacion siempre es bueno limpiarlo para evitar fugas de memoria
  //
  Future<bool> _checkGpsStatus() async {
    //
    final isEnable = await Geolocator.isLocationServiceEnabled();

    Geolocator.getServiceStatusStream().listen((event) {
      //print('service status $event');
      final isEnabled = (event.index == 1) ? true : false;
      print('service status $isEnabled');
    });
    return isEnable;
  }

  //close se llama cuando el bloc ya no se va a utilizar o se va a
  //deshechar
  @override
  Future<void> close() {
    // TODO: limpiar el ServiceStatus stream
    return super.close();
  }
}
