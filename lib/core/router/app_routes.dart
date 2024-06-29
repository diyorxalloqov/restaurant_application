import 'package:restaurant_app/modules/global/imports/app_imports.dart';

class RouteList {
  static final RouteList _generate = RouteList._init();
  static RouteList get router => _generate;

  RouteList._init();
  // int tappedPages = 0;

  Route? onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _navigate(const SplashPage());
      case 'onBoarding':
        return _navigate(const OnBoardingPage());
      case 'login':
        return _navigate(const LoginPage());
      case 'register':
        return _navigate(const RegisterPage());
      case "bottomNavBar":
        return _navigate(const BottomNavBarPage());
      case "locationPage":
        return _navigate(const LocationPage());
    }
    return null;
  }

  _navigate(Widget widget) {
    // tappedPages++;
    // print(tappedPages);
    // if (tappedPages == 6) {
    //   tappedPages = 0;
    //   loadAd();
    //   _interstitialAd?.show();
    // }

    return MaterialPageRoute(builder: (context) => widget);
  }

  // _interstitialAd?.dispose();
  ///               _interstitialAd?.show(); button bosilganda

  // bool isFullPageAdLoaded = false;
  // InterstitialAd? _interstitialAd;

  // void loadAd() {
  //   InterstitialAd.load(
  //     adUnitId: AdHelper.interstitialId(),
  //     request: const AdRequest(),
  //     adLoadCallback: InterstitialAdLoadCallback(
  //         onAdLoaded: (ad) {
  //           _interstitialAd = ad;
  //         },
  //         onAdFailedToLoad: (error) {}),
  //   );
  // }
}
