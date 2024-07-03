import 'package:restaurant_app/modules/global/imports/app_imports.dart';

class FavouriteItem extends StatelessWidget {
  final String image;
  final String name;
  final String rate;
  final VoidCallback onTap;
  const FavouriteItem(
      {super.key,
      required this.onTap,
      required this.name,
      required this.rate,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(image,
                    width: double.infinity, fit: BoxFit.cover)),
            Positioned(
                child: GestureDetector(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SvgPicture.asset(AppIcon.favourite_red),
              ),
            ))
          ],
        ),
        const SpaceHeight(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(name,
                style: const TextStyle(
                    fontWeight: AppFontWeight.w_600,
                    fontSize: AppSizes.size_18)),
            Container(
              padding: const EdgeInsets.all(6),
              decoration:
                  ShapeDecoration(color: greyColor, shape: const OvalBorder()),
              child: Text(
                rate,
                style: const TextStyle(
                    fontSize: AppSizes.size_12,
                    fontWeight: AppFontWeight.w_400),
              ),
            )
          ],
        ),
        const SpaceHeight(height: 10)
      ],
    );
  }
}
