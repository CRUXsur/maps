part of 'location_bloc.dart';

//abstract class LocationState extends Equatable {
//* solo tengo una clase para manejar mi estado...
//*extiende de Equatable, porque necesito poder
//*hacer comparaciones de estado despues
//*especialmente para la parte de bloc

//*que dependencias voy a tener?
class LocationState extends Equatable {
  //*eventualmente yo necesito saber, si yo estoy siguiendo
  //*al usuario..
  final bool followingUser;
  // Done 2 TODO! TODO
  //* 1.- cual fue su ultima ubicacion conocida
  //* o su ultimo geolocation conocido
  //* 2.- y la historia de las ultimas ubicaciones
  final LatLng? lastKnownLocation;
  final List<LatLng> myLocationHistory;

  const LocationState(
      {
      //*required this.followingUser,
      //*por defecto, no quiero que lo este siguiendo
      this.followingUser = false,
      this.lastKnownLocation,
      myLocationHistory})
      : myLocationHistory = myLocationHistory ?? const [];

  //!me creo el copywith, que regresa un nuevo LocationState
  LocationState copyWith({
    bool? followingUser,
    LatLng? lastKnownLocation,
    List<LatLng>? myLocationHistory,
  }) =>
      LocationState(
        followingUser: followingUser ?? this.followingUser,
        lastKnownLocation: lastKnownLocation ?? this.lastKnownLocation,
        myLocationHistory: myLocationHistory ?? this.myLocationHistory,
      );

  //*este @override viene del Equatable
  //*lo pongo aqui el followingUser, para que inclusive
  //* flutter bloc, pueda saber cuando hay un cambio del state
  //!por el lastKnownLocation que son opcionales, entonces
  //!List<Object> lo hago opcional List<Object?>
  @override
  List<Object?> get props =>
      [followingUser, lastKnownLocation, myLocationHistory];
}

//class LocationInitial extends LocationState {}
