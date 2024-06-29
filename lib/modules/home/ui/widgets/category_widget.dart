import 'package:restaurant_app/modules/global/imports/app_imports.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: he(120),
      child: ListView.builder(
          itemCount: 10,
          cacheExtent: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                      color: context.isDark ? categoryColorDark : categoryColor,
                      borderRadius: BorderRadius.circular(6)),
                  child: Center(
                    child: Image.asset(AppImages.default_product),
                  ),
                ),
                const SpaceHeight(height: 2),
                Text(
                  'Alcohol',
                  style: TextStyle(
                      fontSize: AppSizes.size_14,
                      fontWeight: AppFontWeight.w_500),
                )
              ],
            );
          }),
    );
  }
}
