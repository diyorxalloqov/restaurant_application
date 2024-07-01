library;

/**
 *? @author [DiyorXalloqov]
 *? @email [diyorxalloqov@mail.com]
 *? @github [https://github.com/diyorxalloqov]
 *? @LinkedIn [https://www.linkedin.com/in/diyor-xalloqov-024b63231/]
 *? @create date 2024-05-15 10:00:04
 *? @modify date 2024-05-15 10:00:04
 *? @desc [project created]
 */

import 'package:restaurant_app/modules/global/imports/app_imports.dart';
import 'package:restaurant_app/modules/home/service/home_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  if (StorageRepository.getString(Keys.lang) == '') {
    await StorageRepository.putString(Keys.lang, 'uz');
  }

  runApp(EasyLocalization(
      saveLocale: true,
      startLocale: const Locale('en'),
      supportedLocales: const [
        Locale("uz"),
        Locale("en"),
        Locale("ru"),
      ],
      path: "lib/core/lang",
      child: const App()));

  // portraitUp (vertikal) rejimida bo'lishi uchun
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // StatusBar Temasi
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  Upgrader.clearSavedSettings();
}
