import 'package:restaurant_app/modules/accaunt/ui/widgets/accaunt_item_widget.dart';
import 'package:restaurant_app/modules/global/imports/app_imports.dart';

class AccauntPage extends StatefulWidget {
  const AccauntPage({super.key});

  @override
  State<AccauntPage> createState() => _AccauntPageState();
}

class _AccauntPageState extends State<AccauntPage> {
  String selectedLang = StorageRepository.getString(Keys.lang);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const SpaceHeight(height: 10),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            leading: CircleAvatar(
                backgroundImage: AssetImage(AppImages.default_profile)),
            title: Text('Jonh Doe',
                style: TextStyle(
                    fontWeight: AppFontWeight.w_400,
                    fontSize: AppSizes.size_16)),
          ),
          const SpaceHeight(height: 11),
          AccauntItem(onTap: () {}, icon: AppIcon.wallet, text: 'wallet'.tr()),
          AccauntItem(
              onTap: () => showModalBottomSheet(
                  context: context, builder: (c) => lang(context)),
              icon: AppIcon.lang,
              text: 'language'.tr()),
          AccauntItem(
              onTap: () {}, icon: AppIcon.settings, text: 'settings'.tr()),
          AccauntItem(onTap: () {}, icon: AppIcon.help, text: 'help'.tr()),
        ],
      ),
    );
  }

  Widget lang(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 25),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: Text("Tilni ozgartirish"),
          ),
          Container(
            // color: context.isDark
            //     ? bottomSheetBackgroundBlackColor
            //     : bottomSheetBackgroundColor,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(12.0),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 13),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          width: 1,
                          color: selectedLang == 'en'
                              ? greenColor
                              : Colors.transparent),
                      color: selectedLang == 'en'
                          ? Colors.white
                          : context.isDark
                              ? Colors.black
                              : Colors.white),
                  child: GestureDetector(
                    onTap: () async {
                      setState(() {
                        selectedLang = 'en';
                        context.setLocale(const Locale('en'));
                        Navigator.pop(context);
                      });
                      await StorageRepository.putString(Keys.lang, 'en');
                    },
                    child: Text(
                      "English",
                      style: TextStyle(
                        color: selectedLang == 'en'
                            ? greenColor
                            : context.isDark
                                ? Colors.white
                                : Colors.black,
                        fontSize: AppSizes.size_16,
                        fontWeight: AppFontWeight.w_500,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(12.0),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 13),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          width: 1,
                          color: selectedLang == 'uz'
                              ? greenColor
                              : Colors.transparent),
                      color: selectedLang == 'uz'
                          ? Colors.white
                          : context.isDark
                              ? Colors.black
                              : Colors.white),
                  child: GestureDetector(
                    onTap: () async {
                      setState(() {
                        selectedLang = 'uz';
                        context.setLocale(const Locale('uz'));
                        Navigator.pop(context);
                      });
                      await StorageRepository.putString(Keys.lang, 'uz');
                    },
                    child: Text(
                      "O'zbekcha",
                      style: TextStyle(
                        color: selectedLang == 'uz'
                            ? greenColor
                            : context.isDark
                                ? Colors.white
                                : Colors.black,
                        fontSize: AppSizes.size_16,
                        fontWeight: AppFontWeight.w_500,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(12.0),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 13),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          width: 1,
                          color: selectedLang == 'ru'
                              ? greenColor
                              : Colors.transparent),
                      color: selectedLang == 'ru'
                          ? Colors.white
                          : context.isDark
                              ? Colors.black
                              : Colors.white),
                  child: GestureDetector(
                    onTap: () async {
                      setState(() {
                        selectedLang = 'ru';
                        context.setLocale(const Locale('ru'));
                        Navigator.pop(context);
                      });
                      await StorageRepository.putString(Keys.lang, 'ru');
                    },
                    child: Text(
                      "Ruscha",
                      style: TextStyle(
                        color: selectedLang == 'ru'
                            ? greenColor
                            : context.isDark
                                ? Colors.white
                                : Colors.black,
                        fontSize: AppSizes.size_16,
                        fontWeight: AppFontWeight.w_500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      );
}
