import 'package:restaurant_app/modules/global/imports/app_imports.dart';

class App extends StatelessWidget {
  const App({super.key});
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    debugPrint("system is ${Platform.operatingSystem}");
    if (Platform.isAndroid) {
      return const AndroidApp();
    } else if (Platform.isIOS) {
      return const IosApp();
    } else {
      return const WebApp();
    }
  }
}

class AndroidApp extends StatefulWidget {
  const AndroidApp({super.key});

  @override
  State<AndroidApp> createState() => _AndroidAppState();
}

class _AndroidAppState extends State<AndroidApp> {
  @override
  void initState() {
    checkForUpdate();
    super.initState();
  }

  /// update check
  Future<void> checkForUpdate() async {
    debugPrint('checking for Update');
    try {
      InAppUpdate.checkForUpdate().then((info) {
        setState(() {
          if (info.updateAvailability == UpdateAvailability.updateAvailable) {
            debugPrint('update available');
            update();
          }
        });
      }).catchError((e) {
        debugPrint(e.toString());
      });
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  void update() async {
    debugPrint('Updating');
    await InAppUpdate.startFlexibleUpdate();
    InAppUpdate.completeFlexibleUpdate().then((_) {}).catchError((e) {
      debugPrint(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AdaptiveTheme(
      initial: AdaptiveThemeMode.system,
      dark: AppTheme().darkMode,
      light: AppTheme().lightMode,
      builder: (ThemeData theme, ThemeData dark) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          darkTheme: dark,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: theme,
          themeMode: ThemeMode.system,
          navigatorKey: App.navigatorKey,
          initialRoute: '/',
          onGenerateRoute: RouteList.router.onGenerate,
        );
      },
    );
  }
}

class IosApp extends StatefulWidget {
  const IosApp({super.key});

  @override
  State<IosApp> createState() => _IosAppState();
}

class _IosAppState extends State<IosApp> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return CupertinoAdaptiveTheme(
        initial: AdaptiveThemeMode.system,
        dark: AppTheme().cupertinoDarkMode,
        light: AppTheme().cupertinoLightMode,
        builder: (CupertinoThemeData theme) {
          return CupertinoApp(
              debugShowCheckedModeBanner: false,
              navigatorKey: App.navigatorKey,
              initialRoute: '/',
              theme: theme,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              onGenerateRoute: RouteList.router.onGenerate,
              builder: (context, child) {
                return UpgradeAlert(
                  barrierDismissible: false,
                  showIgnore: false,
                  showLater: false,
                  showReleaseNotes: false,
                  dialogStyle: UpgradeDialogStyle.cupertino,
                  upgrader: Upgrader(upgraderOS: UpgraderOS()),
                  navigatorKey: App.navigatorKey,
                  child: CupertinoPageScaffold(
                    child: child!,
                  ),
                );
              });
        });
  }
}

class WebApp extends StatelessWidget {
  const WebApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
