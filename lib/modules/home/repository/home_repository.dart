import 'package:restaurant_app/modules/global/imports/app_imports.dart';
import 'package:restaurant_app/modules/home/model/auto_choice_location_model.dart';
import 'package:restaurant_app/modules/home/service/home_service.dart';

class HomeRepository {
  final HomeService _homeService = HomeService();

  Future<Either<String, AutoChoiceLocationModel>> getLocationIp() async {
    return await _homeService.autoChoiceLocation();
  }

  Future<Either<String, ManualChoiceLocationModel>> getlocationManual(
      String place) async {
    return await _homeService.manuaChoiceLocation(place);
  }
}
