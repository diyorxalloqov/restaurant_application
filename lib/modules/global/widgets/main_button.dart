import 'package:restaurant_app/modules/global/imports/app_imports.dart';

class MainButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const MainButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: Size(double.infinity, he(55)),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          backgroundColor:
              context.isDark ? elevatedButtonDarkColor : elevatedButtonColor,
        ),
        child: Center(
          child: Text(text,
              style: TextStyle(
                  color: context.isDark ? buttonTextDarkColor : buttonTextColor,
                  fontSize: AppSizes.size_16,
                  fontWeight: AppFontWeight.w_700)),
        ));
  }
}
