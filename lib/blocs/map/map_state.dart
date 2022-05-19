part of 'map_bloc.dart';

//* estrategia: no es tener una clase abstracta ,
//* solo voy a tener un tipo de estado y
//* voy a tener el copyWith

class MapState extends Equatable {
  //*ya esta el mapa cargado?, si ya tengo accceso a el?
  //*ya puedo usarlo?
  final bool isMapInitialized;
  final bool followUser;
  const MapState({
    // required this.isMapInitialized,
    // required this.followUser,
    this.isMapInitialized = false,
    this.followUser = false,
  });

  MapState copyWith({
    bool? isMapInitialized,
    bool? followUser,
  }) =>
      MapState(
        //*inicializamos con valores...
        isMapInitialized: isMapInitialized ?? this.isMapInitialized,
        followUser: followUser ?? this.followUser,
      );

  @override
  List<Object> get props => [isMapInitialized, followUser];
}
