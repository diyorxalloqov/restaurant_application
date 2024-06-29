import 'package:restaurant_app/modules/global/imports/app_imports.dart';
import 'package:restaurant_app/modules/onBoarding/ui/widgets/on_boarding_button.dart';

class OnBoarding2 extends StatelessWidget {
  final PageController pageController;
  const OnBoarding2({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImages.onBoarding2), fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox.shrink(),
          Column(
            children: [
              Text(onBoarding2,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: AppFontWeight.w_700,
                      fontSize: AppSizes.size_32)),
              const SpaceHeight(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 47),
                child: Text(onBoarding2des,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: AppFontWeight.w_400,
                        fontSize: AppSizes.size_24)),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: context.bottom / 9 + 70),
            child: OnBoardingButton(
                text: next,
                onTap: () => pageController.nextPage(
                    duration: const Duration(milliseconds: 350),
                    curve: Curves.easeInQuart)),
          )
        ],
      ),
    );
  }
}
