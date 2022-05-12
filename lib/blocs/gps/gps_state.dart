part of 'gps_bloc.dart';

//abstract class GpsState extends Equatable {
class GpsState extends Equatable {
  final bool isGpsEnabled;
  final bool isGpsPermissionGranted;

  //!me creo un getter,que me diga si todo esta bien
  //!o alguno de los dos esta mal....
  //! si los dos true => isAllGranted es true
  //! si un de los dos es false = > isAllGranted es false
  bool get isAllGranted => isGpsEnabled && isGpsPermissionGranted;

  //llaves: por que quiero que sea por nombre
  const GpsState({
    required this.isGpsEnabled,
    required this.isGpsPermissionGranted,
  });

  GpsState copyWith({
    bool? isGpsEnabled,
    bool? isGpsPermissionGranted,
  }) =>
      GpsState(
        isGpsEnabled: isGpsEnabled ?? this.isGpsEnabled,
        isGpsPermissionGranted:
            isGpsPermissionGranted ?? this.isGpsPermissionGranted,
      );

  @override
  List<Object> get props => [isGpsEnabled, isGpsPermissionGranted];

  //Sobre escribo este metodo para el //print('state: $state');
  @override
  String toString() =>
      '{isGpsEnabled: $isGpsEnabled,isGpsPermissionGranted: $isGpsPermissionGranted}';
}
//class GpsInitial extends GpsState {}
