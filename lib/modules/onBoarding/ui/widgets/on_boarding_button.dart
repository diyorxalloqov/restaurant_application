import 'package:restaurant_app/modules/global/imports/app_imports.dart';

class OnBoardingButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const OnBoardingButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            fixedSize: Size(wi(150), he(54)),
            backgroundColor: const Color(0xffD9D9D9).withOpacity(0.34),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                    width: 1, color: Colors.white.withOpacity(0.8)))),
        child: Text(text,
            style: const TextStyle(
                color: Colors.white,
                fontSize: AppSizes.size_20,
                fontWeight: AppFontWeight.w_600)));
  }
}
