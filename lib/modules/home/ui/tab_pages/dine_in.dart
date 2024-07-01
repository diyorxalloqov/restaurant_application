import 'package:restaurant_app/modules/global/imports/app_imports.dart';
import 'package:restaurant_app/modules/home/ui/widgets/category_widget.dart';
import 'package:restaurant_app/modules/home/ui/widgets/delivery_item.dart';
import 'package:restaurant_app/modules/home/ui/widgets/page_view_widget.dart';

class DineIn extends StatelessWidget {
  const DineIn({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                child: DeliveryItem(),
              ),
            ],
          );
        });
  }
}
