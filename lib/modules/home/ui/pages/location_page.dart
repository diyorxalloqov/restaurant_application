import 'package:restaurant_app/modules/global/imports/app_imports.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  bool isScheduled = false;
  int? selectedLocationIndex;
  bool isCurrentLocation = StorageRepository.getBool(Keys.isCurrentlocation);
  late TextEditingController _locationController;

  @override
  void initState() {
    _locationController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _locationController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    context.read<HomeBloc>().state.manualChoiceLocationModel?.results?.clear();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text('address'.tr(),
            style: const TextStyle(
                fontWeight: AppFontWeight.w_500, fontSize: AppSizes.size_20)),
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: SvgPicture.asset(AppIcon.schedule, width: 24, height: 24),
            title: Text('deliverNow'.tr(),
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
                    color: greyColor, borderRadius: BorderRadius.circular(99)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('schedule'.tr(),
                        style: const TextStyle(
                            fontWeight: AppFontWeight.w_500,
                            fontSize: AppSizes.size_14)),
                    const SizedBox(width: 5),
                    isScheduled
                        ? SvgPicture.asset(AppIcon.tick)
                        : const SizedBox.shrink()
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Divider(color: dividerColor, thickness: 10),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('nearby'.tr(),
                    style: const TextStyle(
                        fontWeight: AppFontWeight.w_500,
                        fontSize: AppSizes.size_16)),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _locationController,
                  decoration: InputDecoration(
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      filled: true,
                      fillColor: context.isDark
                          ? textFormFieldFillDarkColor
                          : textFormFieldFillColor,
                      suffix: InkWell(
                        onTap: () {
                          context.read<HomeBloc>().add(GetLocationManual(
                              place: _locationController.text));
                          debugPrint('searching...');
                        },
                        child: Icon(Icons.search,
                            color: context.isDark
                                ? searchIconDarkColor
                                : searchIconColor),
                      ),
                      hintText: 'addressEnter'.tr()),
                ),
                Column(
                  children: [
                    const SizedBox(height: 20),
                    ListTile(
                      leading: SvgPicture.asset(AppIcon.current_location),
                      title: Text('currentLocation'.tr(),
                          style: const TextStyle(
                              fontSize: AppSizes.size_16,
                              fontWeight: AppFontWeight.w_500)),
                      trailing: GestureDetector(
                        onTap: () async {
                          setState(() {
                            selectedLocationIndex = -1;
                            if (isCurrentLocation == false) {
                              context.read<HomeBloc>().add(GetLocationIp());
                              context.read<HomeBloc>().add(GetLocation());
                            }
                            isCurrentLocation = true;
                          });
                          await StorageRepository.putBool(
                              Keys.isCurrentlocation, isCurrentLocation);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          decoration: BoxDecoration(
                              color: greyColor,
                              borderRadius: BorderRadius.circular(99)),
                          child: Text(
                              isCurrentLocation
                                  ? 'disable'.tr()
                                  : 'enable'.tr(),
                              style: const TextStyle(
                                  fontWeight: AppFontWeight.w_500,
                                  fontSize: AppSizes.size_14)),
                        ),
                      ),
                    ),
                    Divider(thickness: 1, color: dividerColor)
                  ],
                ),
                BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
                  if (state.locationManualStatus == ActionStatus.isLoading) {
                    return Center(
                        child: Column(
                      children: [
                        SpaceHeight(height: context.height * .2),
                        const CircularProgressIndicator(),
                      ],
                    ));
                  } else if (state.locationManualStatus ==
                      ActionStatus.isError) {
                    return Center(
                        child: Column(
                      children: [
                        SpaceHeight(height: context.height * .2),
                        Text(state.locationManualError,
                            style: const TextStyle(
                                fontSize: AppSizes.size_16,
                                fontWeight: AppFontWeight.w_500))
                      ],
                    ));
                  } else if (state.locationManualStatus ==
                      ActionStatus.isSuccess) {
                    return Column(
                        children: List.generate(
                            state.manualChoiceLocationModel?.results?.length ??
                                0, (index) {
                      return LocationItem(
                        isSelected: selectedLocationIndex == index,
                        onTap: () async {
                          setState(() {
                            selectedLocationIndex = index;
                            isCurrentLocation = false;
                          });
                          context.read<HomeBloc>().add(GetLocation());
                          await StorageRepository.putString(
                              Keys.location,
                              state.manualChoiceLocationModel?.results?[index]
                                      .addressLine1 ??
                                  '');
                          await StorageRepository.putBool(
                              Keys.isCurrentlocation, false);
                        },
                        title: state.manualChoiceLocationModel?.results?[index]
                                .addressLine1 ??
                            '',
                        subtitle: state.manualChoiceLocationModel
                                ?.results?[index].addressLine2 ??
                            '',
                      );
                    }));
                  } else {
                    return const SizedBox.shrink();
                  }
                })
              ],
            ),
          ),
        ],
      )),
    );
  }
}

class LocationItem extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final String title;
  final String subtitle;

  const LocationItem({
    super.key,
    required this.isSelected,
    required this.onTap,
    required this.title,
    required this.subtitle,
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
            subtitle,
            style: TextStyle(
                color: itemSubtitleColor,
                fontWeight: AppFontWeight.w_500,
                fontSize: AppSizes.size_16),
          ),
          title: Text(title,
              style: const TextStyle(
                  fontWeight: AppFontWeight.w_500, fontSize: AppSizes.size_16)),
        ),
        Divider(thickness: 1, color: dividerColor),
      ],
    );
  }
}
