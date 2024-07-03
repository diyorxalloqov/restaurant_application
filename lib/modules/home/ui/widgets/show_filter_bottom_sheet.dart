import 'package:restaurant_app/modules/global/imports/app_imports.dart';

showFilterBottomSheet(BuildContext context) {
  showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      context: context,
      builder: (context) => const ShowFilterBottomSheet());
}

class ShowFilterBottomSheet extends StatefulWidget {
  const ShowFilterBottomSheet({super.key});

  @override
  State<ShowFilterBottomSheet> createState() => _ShowFilterBottomSheetState();
}

class _ShowFilterBottomSheetState extends State<ShowFilterBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SpaceHeight(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () => Navigator.pop(context),
                icon: SvgPicture.asset(AppIcon.cancel)),
            Text('filters'.tr(),
                style: const TextStyle(
                    fontWeight: AppFontWeight.w_500,
                    fontSize: AppSizes.size_20)),
            SpaceWidth(width: context.width * 0.1)
          ],
        ),
        const Divider(),
        SizedBox(
          height: context.height * 0.75,
          child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return const FilterItem();
              }),
        )
      ],
    );
  }
}

class FilterItem extends StatefulWidget {
  const FilterItem({super.key});

  @override
  State<FilterItem> createState() => _FilterItemState();
}

class _FilterItemState extends State<FilterItem> {
  int? currentIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text('Sort',
              style: TextStyle(
                  fontWeight: AppFontWeight.w_500, fontSize: AppSizes.size_18)),
        ),
        Column(
          children: List.generate(
              5,
              (index) => ListTile(
                    leading: SvgPicture.asset(AppIcon.default_filter),
                    onTap: () {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    title: Text('asdasds',
                        style: const TextStyle(
                            fontSize: AppSizes.size_16,
                            fontWeight: AppFontWeight.w_400)),
                    trailing: currentIndex == index
                        ? SvgPicture.asset(AppIcon.tick)
                        : null,
                  )),
        ),
      ],
    );
  }
}
