
import 'package:restaurant_app/modules/global/imports/app_imports.dart';

class PickUp extends StatelessWidget {
  const PickUp({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4, // Changed from 3 + 1 to 4
      itemBuilder: (context, index) {
        if (index == 0) {
          return const Column(
            children: [
              PickUpMap(),
              SpaceHeight(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: CategoryWidgetPickUp(),
              ),
            ],
          );
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(color: dividerColor, thickness: 10),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
              child: Text(
                'Fast foods',
                style: const TextStyle(
                    fontSize: AppSizes.size_24,
                    fontWeight: AppFontWeight.w_700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: DeliveryItem(),
            ),
          ],
        );
      },
    );
  }
}