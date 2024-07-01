import 'package:restaurant_app/modules/global/imports/app_imports.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  String routeName = StorageRepository.getBool(Keys.isEntered)
      ? 'bottomNavBar' //'login
      : 'onBoarding';
  // 'login';

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3))
        .then((value) => Navigator.pushNamed(context, routeName));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: splashColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppImages.splash),
          Text('appName'.tr(),
              style: TextStyle(
                  fontSize: AppSizes.size_48,
                  fontWeight: AppFontWeight.w_700,
                  fontFamily: AppfontFamily.inter,
                  color: splashTextColor))
        ],
      ),
    );
  }
}
