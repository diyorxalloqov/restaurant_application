import 'package:restaurant_app/modules/global/imports/app_imports.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return DefaultTabController(
          length: 3,
          child: Column(children: [
            Expanded(
              child: TabBar(
                  indicatorColor: Colors.transparent,
                  unselectedLabelColor:
                  context.isDark ? Colors.white : Colors.black,
                  labelColor: Colors.white,
                  dividerColor: Colors.transparent,
                  splashBorderRadius: BorderRadius.circular(24),
                  labelStyle: const TextStyle(
                      fontSize: AppSizes.size_14,
                      fontWeight: AppFontWeight.w_500),
                  unselectedLabelStyle: const TextStyle(
                      fontSize: AppSizes.size_14,
                      fontWeight: AppFontWeight.w_500),
                  indicator: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(24)),
                  indicatorSize: TabBarIndicatorSize.tab,
                  isScrollable: true,
                  indicatorWeight: 0,
                  padding: EdgeInsets.zero,
                  tabAlignment: TabAlignment.start,
                  tabs: [
                    Tab(text: 'delivery'.tr()),
                    Tab(text: 'pickUp'.tr()),
                    Tab(text: 'dineIn'.tr()),
                  ]),
            ),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SpaceWidth(width: 20),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, 'locationPage'),
                    child: Text('${"now".tr()} • ${state.locationWithIp}',
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        style: const TextStyle(
                            fontWeight: AppFontWeight.w_500,
                            fontSize: AppSizes.size_18)),
                  ),
                  Row(
                    children: [
                      const SpaceWidth(width: 20),
                      IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(AppIcon.filter,
                              color: context.isDark ? Colors.white : null)),
                      const SpaceWidth(width: 5),
                    ],
                  ),
                ],
              ),
            ),
            const SpaceHeight(height: 5),
            const Expanded(
              flex: 11,
              child: TabBarView(children: [Delivery(), PickUp(), DineIn()]),
            ),
          ]),
        );
      },
    );
  }
}
