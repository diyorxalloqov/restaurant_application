import 'package:restaurant_app/modules/favourite/ui/widgets/favourite_item.dart';
import 'package:restaurant_app/modules/global/imports/app_imports.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SearchBar(
            hintText: 'searchFavouriteHint'.tr(),
            leading: const Icon(Icons.search),
            backgroundColor: WidgetStatePropertyAll<Color>(searchBarColor2),
            padding: const WidgetStatePropertyAll<EdgeInsets>(
                EdgeInsets.symmetric(horizontal: 10)),
          ),
        ),
        Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return FavouriteItem(
                    onTap: () {},
                    name: 'Frish foods',
                    rate: '4.3',
                    image: AppImages.default_product_max,
                  );
                }))
      ],
    );
  }
}
