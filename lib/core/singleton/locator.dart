import 'package:easy_localization/easy_localization.dart';
import 'package:get_it/get_it.dart';
import 'package:restaurant_app/core/db/shared/shared_preferences.dart';
import 'package:restaurant_app/core/singleton/dio.dart';

final serviceLocator = GetIt.I;

Future<void> setupLocator() async {
  await EasyLocalization.ensureInitialized();
  await StorageRepository.getInstance();
  serviceLocator.registerLazySingleton<DioSettings>(DioSettings.new);
  // await Hive.initFlutter();
  // await MobileAds.instance.initialize();
}
