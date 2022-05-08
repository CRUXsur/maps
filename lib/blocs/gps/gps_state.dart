part of 'gps_bloc.dart';

//abstract class GpsState extends Equatable {
class GpsState extends Equatable {
  final bool isGpsEnabled;
  final bool isGpsPermissionGranted;

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
