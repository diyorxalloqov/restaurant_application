import 'package:restaurant_app/modules/global/imports/app_imports.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final bool? obscureText;

  const TextFormFieldWidget(
      {super.key,
      required this.hintText,
      this.controller,
      this.onTap,
        this.obscureText,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscuringCharacter: '*',
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
          filled: true,
          fillColor: context.isDark
              ? textFormFieldFillDarkColor
              : textFormFieldFillColor,
          hintText: hintText,
          constraints: BoxConstraints(maxHeight: he(60)),
          border: InputBorder.none,
          suffixIcon: suffixIcon != null
              ? GestureDetector(
                  behavior: HitTestBehavior.deferToChild,
                  onTap: onTap,
                  child: suffixIcon)
              : null),
    );
  }
}
