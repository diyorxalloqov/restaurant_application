import 'package:restaurant_app/modules/global/imports/app_imports.dart';

class AccauntItem extends StatelessWidget {
  final String icon;
  final String text;
  final VoidCallback onTap;
  const AccauntItem(
      {super.key, required this.onTap, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: SvgPicture.asset(icon),
      title: Text(text,
          style: const TextStyle(
              fontWeight: AppFontWeight.w_600, fontSize: AppSizes.size_14)),
    );
  }
}
