import 'package:restaurant_app/modules/global/imports/app_imports.dart';
import 'package:restaurant_app/modules/search/ui/widgets/search_item_widget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SearchBar(
            hintText: 'searchPageHint'.tr(),
            leading: const Icon(Icons.search),
            backgroundColor: WidgetStatePropertyAll<Color>(searchBarColor2),
            padding: const WidgetStatePropertyAll<EdgeInsets>(
                EdgeInsets.symmetric(horizontal: 10)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Text('allCategories'.tr(),
              style: const TextStyle(
                  fontWeight: AppFontWeight.w_500, fontSize: AppSizes.size_24)),
        ),
        SearchItemWidget(
            onTap: () {},
            itemCount: 10,
            image: AppImages.search_product,
            text: 'Breakfast & brunch')
      ],
    );
  }
}
