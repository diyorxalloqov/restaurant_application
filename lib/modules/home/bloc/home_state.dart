part of 'home_bloc.dart';

class HomeState extends Equatable {
  final ActionStatus locationIpStatus;
  final ActionStatus locationManualStatus;
  final String locationIpError;
  final String locationManualError;
  final ManualChoiceLocationModel? manualChoiceLocationModel;
  final String locationWithIp;

  const HomeState(
      {this.manualChoiceLocationModel,
      this.locationIpError = '',
      this.locationManualError = '',
      this.locationIpStatus = ActionStatus.isInitial,
      this.locationManualStatus = ActionStatus.isInitial,
      this.locationWithIp = ''});

  HomeState copyWith(
      {ManualChoiceLocationModel? manualChoiceLocationModel,
      String? locationWithIp,
      ActionStatus? locationIpStatus,
      ActionStatus? locationManualStatus,
      String? locationManualError,
      String? locationIpError}) {
    return HomeState(
        locationIpError: locationIpError ?? this.locationIpError,
        locationManualStatus: locationManualStatus ?? this.locationManualStatus,
        locationIpStatus: locationIpStatus ?? this.locationIpStatus,
        locationManualError: locationManualError ?? this.locationManualError,
        locationWithIp: locationWithIp ?? this.locationWithIp,
        manualChoiceLocationModel:
            manualChoiceLocationModel ?? this.manualChoiceLocationModel);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        locationIpError,
        locationManualStatus,
        locationIpStatus,
        locationManualError,
        locationWithIp,
        manualChoiceLocationModel
      ];
}
