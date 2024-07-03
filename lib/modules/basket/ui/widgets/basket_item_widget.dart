import 'package:restaurant_app/modules/global/imports/app_imports.dart';

class BasketItem extends StatelessWidget {
  final VoidCallback onTap;
  final String image;
  final String title;
  final String subtitle;
  const BasketItem(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          isThreeLine: true,
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(image),
          ),
          title: Text(title,
              style: const TextStyle(
                  fontWeight: AppFontWeight.w_500, fontSize: AppSizes.size_16)),
          subtitle: Text(subtitle,
              style: TextStyle(
                  fontSize: AppSizes.size_14,
                  color: itemSubtitleColor,
                  fontWeight: AppFontWeight.w_400)),
          trailing: IconButton(
              onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios)),
        ),
        const Divider(indent: 90, endIndent: 40)
      ],
    );
  }
}
