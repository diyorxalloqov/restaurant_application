import 'package:restaurant_app/modules/global/imports/app_imports.dart';
import 'package:restaurant_app/modules/onBoarding/ui/pages/onBoarding1.dart';
import 'package:restaurant_app/modules/onBoarding/ui/pages/onBoarding2.dart';
import 'package:restaurant_app/modules/onBoarding/ui/pages/onBoarding3.dart';
import 'package:restaurant_app/modules/onBoarding/ui/pages/onBoarding4.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff3C3A3A),
      body: PageView(
        controller: _pageController,
        children: [
          OnBoarding1(pageController: _pageController),
          OnBoarding2(pageController: _pageController),
          OnBoarding3(pageController: _pageController),
          OnBoarding4(pageController: _pageController),
        ],
      ),
    );
  }
}
