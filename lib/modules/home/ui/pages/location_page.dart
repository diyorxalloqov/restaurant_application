import 'package:restaurant_app/modules/global/imports/app_imports.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  bool isScheduled = false;
  int? selectedLocationIndex;
  bool isCurrentLocation = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(address,
            style: const TextStyle(
                fontWeight: AppFontWeight.w_500, fontSize: AppSizes.size_20)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading:
                  SvgPicture.asset(AppIcon.schedule, width: 24, height: 24),
              title: Text(deliverNow,
                  style: const TextStyle(
                      fontSize: AppSizes.size_16,
                      fontWeight: AppFontWeight.w_500)),
              trailing: GestureDetector(
                onTap: () {
                  setState(() {
                    isScheduled = !isScheduled;
                  });
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                      color: greyColor,
                      borderRadius: BorderRadius.circular(99)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(schedule,
                          style: const TextStyle(
                              fontWeight: AppFontWeight.w_500,
                              fontSize: AppSizes.size_14)),
                      const SpaceWidth(width: 5),
                      isScheduled
                          ? SvgPicture.asset(AppIcon.tick)
                          : const SizedBox.shrink()
                    ],
                  ),
                ),
              ),
            ),
            const SpaceHeight(height: 10),
            Divider(color: dividerColor, thickness: 10),
            const SpaceHeight(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(nearby,
                      style: const TextStyle(
                          fontWeight: AppFontWeight.w_500,
                          fontSize: AppSizes.size_16)),
                  const SpaceHeight(height: 8),
                  TextFormField(
                    decoration: InputDecoration(
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        filled: true,
                        fillColor: context.isDark
                            ? textFormFieldFillDarkColor
                            : textFormFieldFillColor,
                        suffix: InkWell(
                          onTap: () {
                            //! search function
                            debugPrint('searching...');
                          },
                          child: Icon(Icons.search,
                              color: context.isDark
                                  ? searchIconDarkColor
                                  : searchIconColor),
                        ),
                        hintText: addressEnter),
                  ),
                  Column(
                    children: List.generate(15, (index) {
                      if (index == 0) {
                        return Column(
                          children: [
                            const SpaceHeight(height: 20),
                            ListTile(
                              leading:
                                  SvgPicture.asset(AppIcon.current_location),
                              title: Text(currentLocation,
                                  style: const TextStyle(
                                      fontSize: AppSizes.size_16,
                                      fontWeight: AppFontWeight.w_500)),
                              trailing: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isCurrentLocation = !isCurrentLocation;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 10),
                                  decoration: BoxDecoration(
                                      color: greyColor,
                                      borderRadius: BorderRadius.circular(99)),
                                  child: Text(
                                      isCurrentLocation ? disable : enable,
                                      style: const TextStyle(
                                          fontWeight: AppFontWeight.w_500,
                                          fontSize: AppSizes.size_14)),
                                ),
                              ),
                            ),
                            Divider(thickness: 1, color: dividerColor)
                          ],
                        );
                      }
                      return LocationItem(
                        isSelected: selectedLocationIndex == index,
                        onTap: () {
                          setState(() {
                            selectedLocationIndex = index;
                          });
                        },
                      );
                    }),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LocationItem extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;

  const LocationItem({
    super.key,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          trailing: isSelected
              ? SvgPicture.asset(AppIcon.tick)
              : const SizedBox.shrink(),
          leading: SvgPicture.asset(AppIcon.location),
          subtitle: Text(
            "CA",
            style: TextStyle(
                color: itemSubtitleColor,
                fontWeight: AppFontWeight.w_500,
                fontSize: AppSizes.size_16),
          ),
          title: Text('California',
              style: TextStyle(
                  fontWeight: AppFontWeight.w_500, fontSize: AppSizes.size_16)),
        ),
        Divider(thickness: 1, color: dividerColor),
      ],
    );
  }
}
