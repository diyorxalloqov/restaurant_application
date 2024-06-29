import 'package:restaurant_app/modules/global/imports/app_imports.dart';
import 'package:restaurant_app/modules/home/model/auto_choice_location_model.dart';
import 'package:restaurant_app/modules/home/model/manual_choice_location_model.dart';

class HomeService {
  final Dio client = serviceLocator<DioSettings>().dio;
  final List<String> apiKeys = [
    "5651ef63d5444573b410f711ca85aaa0",
    "12fd37d29a1b47afa13998b079bac572",
    "aeb7b532d7344768b4a2be486835980b",
    "25c48c619bae49c28005cbbd22e6a6b2"
  ];

  Future<Either<String, AutoChoiceLocationModel>> autoChoiceLocation() async {
    final String randomKey = apiKeys[Random().nextInt(apiKeys.length)];
    debugPrint(randomKey);
    try {
      Response response = await client
          .get('https://api.geoapify.com/v1/ipinfo', queryParameters: {
        "lang":  StorageRepository.getString(Keys.lang),
        "limit": 10,
        "format": "json",
        "type": "city",
        "apiKey": randomKey
      });
      debugPrint(response.realUri.toString());
      debugPrint(response.data.toString());
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return right(AutoChoiceLocationModel.fromJson(response.data));
      } else {
        return left(response.statusMessage.toString());
      }
    } on DioException catch (e) {
      debugPrint('exeption');
      return left(e.message.toString());
    }
  }

  Future<Either<String, ManualChoiceLocationModel>> manuaChoiceLocation(
      String place) async {
    final String randomKey = apiKeys[Random().nextInt(apiKeys.length)];
    debugPrint(randomKey);
    try {
      Response response = await client
          .get('https://api.geoapify.com/v1/geocode/search', queryParameters: {
        "text": place,
        "lang": StorageRepository.getString(Keys.lang),
        "limit": 10,
        "format": "json",
        "type": "city",
        "apiKey": randomKey
      });
      debugPrint("${response.data}");
      debugPrint(response.statusCode.toString());
      debugPrint(response.realUri.toString());
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return right(ManualChoiceLocationModel.fromJson(response.data));
      } else {
        return left(response.statusMessage.toString());
      }
    } on DioException catch (e) {
      debugPrint('exeption');
      debugPrint(e.message);
      return left(e.message.toString());
    }
  }
}
