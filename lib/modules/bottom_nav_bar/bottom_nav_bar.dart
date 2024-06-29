import 'package:restaurant_app/modules/accaunt/ui/accaunt_page.dart';
import 'package:restaurant_app/modules/basket/ui/basket_page.dart';
import 'package:restaurant_app/modules/favourite/ui/favourite_page.dart';
import 'package:restaurant_app/modules/global/imports/app_imports.dart';
import 'package:restaurant_app/modules/home/ui/home_page.dart';
import 'package:restaurant_app/modules/search/ui/search_page.dart';

class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({super.key});

  @override
  State<BottomNavBarPage> createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  int currentIndex = 0;
  final List<Widget> _screens = const [
    HomePage(),
    SearchPage(),
    FavouritePage(),
    BasketPage(),
    AccauntPage()
  ];

  final List<String> activeIcons = const [
    AppIcon.home,
    AppIcon.browse,
    AppIcon.favourite,
    AppIcon.baskets,
    AppIcon.accaunt
  ];

  final List<String> icons = const [
    AppIcon.home_1,
    AppIcon.browse_1,
    AppIcon.favourite_1,
    AppIcon.baskets_1,
    AppIcon.accaunt_1
  ];
  final List<String> _labels = [home, browse, favourite, basket, accaunt];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _screens[currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        fixedColor:
            context.isDark ? Colors.white : selectedBottomNavbaritemColor,
        unselectedItemColor: unselectedBottomNavbaritemColor,
        showUnselectedLabels: true,
        unselectedLabelStyle: const TextStyle(fontWeight: AppFontWeight.w_400),
        onTap: (v) {
          setState(() {
            currentIndex = v;
          });
        },
        items: List.generate(
            5,
            (index) => BottomNavigationBarItem(
                icon: SvgPicture.asset(icons[index]),
                activeIcon: SvgPicture.asset(activeIcons[index],
                    color: context.isDark ? Colors.white : null),
                label: _labels[index])),
      ),
    );
  }
}
