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
  // TODO:
  //* cual fue su ultima ubicacion conocida
  //* o su ultimo geolocation conocido
  //* y la historia de las ultimas ubicaciones

  const LocationState({
    //*required this.followingUser,
    //*por defecto, no quiero que lo este siguiendo
    this.followingUser = false,
  });

  //*este @override viene del Equatable
  //*lo pongo aqui el followingUser, para que inclusive
  //* flutter bloc, pueda saber cuando hay un cambio del state
  @override
  List<Object> get props => [followingUser];
}

//class LocationInitial extends LocationState {}
