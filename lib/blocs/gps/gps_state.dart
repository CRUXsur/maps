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

  @override
  List<Object> get props => [isGpsEnabled, isGpsPermissionGranted];
}
//class GpsInitial extends GpsState {}
