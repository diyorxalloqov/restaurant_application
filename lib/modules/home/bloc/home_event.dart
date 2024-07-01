part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();
}

class GetLocationIp extends HomeEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetLocationManual extends HomeEvent {
  final String place;
  const GetLocationManual({required this.place});

  @override
  // TODO: implement props
  List<Object?> get props => [place];
}

class GetLocation extends HomeEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
