import 'package:restaurant_app/modules/basket/ui/widgets/basket_item_widget.dart';
import 'package:restaurant_app/modules/global/imports/app_imports.dart';

class BasketPage extends StatelessWidget {
  final VoidCallback onTap;
  const BasketPage({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SpaceHeight(height: 10),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Text(
              'carts'.tr(),
              style: const TextStyle(
                  fontSize: AppSizes.size_36, fontWeight: AppFontWeight.w_700),
            ),
          ),
        ),
        //! is not empty
        Expanded(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return BasketItem(
                    onTap: () {},
                    title: 'Begs & Megs',
                    image: AppImages.default_product_max,
                    subtitle:
                        '1 item    US43.00\nDeliver to San Franciscao Bay Area',
                  );
                })),
        // Column(
        //   children: [
        //     const SpaceHeight(height: 71),
        //     Center(child: Image.asset(AppImages.carts)),
        //     Text('basketEmpty'.tr(),
        //         style: const TextStyle(
        //             fontSize: AppSizes.size_20,
        //             fontWeight: AppFontWeight.w_500)),
        //     const SpaceHeight(height: 12),
        //     Text('basketEmptyDesc'.tr(),
        //         style: TextStyle(
        //             fontSize: AppSizes.size_16,
        //             fontWeight: AppFontWeight.w_400,
        //             color: basketDescColor)),
        //     const SpaceHeight(height: 38),
        //     ElevatedButton(
        //         onPressed: onTap,
        //         style: ElevatedButton.styleFrom(
        //             padding: const EdgeInsets.symmetric(
        //                 vertical: 10, horizontal: 16),
        //             shape: RoundedRectangleBorder(
        //                 borderRadius: BorderRadius.circular(99))),
        //         child: Text('startShopping'.tr(),
        //             style: const TextStyle(
        //                 color: Colors.white,
        //                 fontWeight: AppFontWeight.w_500,
        //                 fontSize: AppSizes.size_14))),
        //   ],
        // )
      ],
    );
  }
}
