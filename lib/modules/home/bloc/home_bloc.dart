import 'package:restaurant_app/modules/global/imports/app_imports.dart';
import 'package:restaurant_app/modules/home/model/auto_choice_location_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<GetLocationIp>(_getLocationIp);
    on<GetLocationManual>(_getLocationManual);
    on<GetLocation>(_getlocation);
    add(GetLocation());
  }

  final HomeRepository _homeRepository = HomeRepository();

  Future<FutureOr<void>> _getLocationIp(
      GetLocationIp event, Emitter<HomeState> emit) async {
    emit(state.copyWith(locationIpStatus: ActionStatus.isLoading));
    Either<String, AutoChoiceLocationModel> data =
        await _homeRepository.getLocationIp();
    data.fold(
        (l) => emit(state.copyWith(
            locationIpStatus: ActionStatus.isError,
            locationIpError: l)), (r) async {
      emit(state.copyWith(
          locationIpStatus: ActionStatus.isSuccess,
          locationWithIp:
              '${r.country?.nameNative ?? ''}, ${r.country?.capital ?? ''}'));
      await StorageRepository.putString(Keys.location,
          '${r.country?.nameNative ?? ''}, ${r.country?.capital ?? ''}');
    });
  }

  Future<FutureOr<void>> _getLocationManual(
      GetLocationManual event, Emitter<HomeState> emit) async {
    emit(state.copyWith(locationManualStatus: ActionStatus.isLoading));
    Either<String, ManualChoiceLocationModel> data =
        await _homeRepository.getlocationManual(event.place);
    data.fold(
        (l) => emit(state.copyWith(
            locationManualStatus: ActionStatus.isError,
            locationManualError: l)),
        (r) => emit(state.copyWith(
            locationManualStatus: ActionStatus.isSuccess,
            manualChoiceLocationModel: r)));
  }

  Future<FutureOr<void>> _getlocation(
      GetLocation event, Emitter<HomeState> emit) async {
    emit(state.copyWith(
        locationWithIp: StorageRepository.getString(Keys.location) ?? ''));
  }
}
