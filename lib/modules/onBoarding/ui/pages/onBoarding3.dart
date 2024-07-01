import 'package:restaurant_app/modules/global/imports/app_imports.dart';
import 'package:restaurant_app/modules/onBoarding/ui/widgets/on_boarding_button.dart';

class OnBoarding3 extends StatelessWidget {
  final PageController pageController;
  const OnBoarding3({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImages.onBoarding3), fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox.shrink(),
          Column(
            children: [
              Text('onBoarding3'.tr(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: AppFontWeight.w_700,
                      fontSize: AppSizes.size_32)),
              const SpaceHeight(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 47),
                child: Text('onBoarding3des'.tr(),
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
                text: 'next'.tr(),
                onTap: () => pageController.nextPage(
                    duration: const Duration(milliseconds: 350),
                    curve: Curves.easeInQuart)),
          )
        ],
      ),
    );
  }
}
