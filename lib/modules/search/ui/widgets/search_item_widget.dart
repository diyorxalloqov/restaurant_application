import 'package:restaurant_app/modules/global/imports/app_imports.dart';

class SearchItemWidget extends StatelessWidget {
  final String image;
  final String text;
  final int itemCount;
  final VoidCallback onTap;
  const SearchItemWidget(
      {super.key,
      required this.onTap,
      required this.itemCount,
      required this.text,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 16 / 17.5,
              crossAxisSpacing: 10,
              mainAxisSpacing: 16,
              crossAxisCount: 2),
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(15),
              child: Container(
                height: he(100),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(width: 1, color: gridItemBorderColor)),
                child: Column(
                  children: [
                    ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(15),
                            topLeft: Radius.circular(15)),
                        child: Image.asset(image, fit: BoxFit.cover)),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, top: 5.0, right: 10.0),
                        child: Text(text,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: AppSizes.size_16,
                                fontWeight: AppFontWeight.w_400)),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
