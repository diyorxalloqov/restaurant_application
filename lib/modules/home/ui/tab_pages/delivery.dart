import 'package:restaurant_app/modules/global/imports/app_imports.dart';
import 'package:restaurant_app/modules/home/ui/widgets/category_widget.dart';
import 'package:restaurant_app/modules/home/ui/widgets/delivery_item.dart';
import 'package:restaurant_app/modules/home/ui/widgets/page_view_widget.dart';

class Delivery extends StatelessWidget {
  const Delivery({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3 + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  PageViewWidget(onTap: () {}),
                  const SpaceHeight(height: 14),
                  const CategoryWidget(),
                ],
              ),
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(color: dividerColor, thickness: 10),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                child: Text('Fast foods',
                    style: const TextStyle(
                        fontSize: AppSizes.size_24,
                        fontWeight: AppFontWeight.w_700)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: DeliveryItem(

                ),
              ),
            ],
          );
        });
  }
}
