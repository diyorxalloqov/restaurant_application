import 'package:get_it/get_it.dart';
import 'package:restaurant_app/modules/global/imports/app_imports.dart';

final serviceLocator = GetIt.I;

Future<void> setupLocator() async {
  await EasyLocalization.ensureInitialized();
  await StorageRepository.getInstance();
  serviceLocator.registerLazySingleton<DioSettings>(DioSettings.new);
  // await Hive.initFlutter();
  // await MobileAds.instance.initialize();
}
