import 'package:restaurant_app/modules/global/imports/app_imports.dart';

class DeliveryItem extends StatefulWidget {
  // final DeliveryModel deliveryModel;

  const DeliveryItem({super.key});

  @override
  State<DeliveryItem> createState() => _DeliveryItemState();
}

class _DeliveryItemState extends State<DeliveryItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(2, (index) {
        return DeliveryItemWidget(
            onTap: () {},
            isOrdered: index == 0,
            isClosed: index == 2 - 1,
            index: index);
      }),
    );
  }
}

class DeliveryItemWidget extends StatefulWidget {
  final int index;
  final bool isClosed;
  final bool isOrdered;
  final VoidCallback onTap;
  const DeliveryItemWidget(
      {super.key,
      required this.isOrdered,
      required this.isClosed,
      required this.onTap,
      required this.index});

  @override
  State<DeliveryItemWidget> createState() => _DeliveryItemWidgetState();
}

class _DeliveryItemWidgetState extends State<DeliveryItemWidget> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: widget.onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
              alignment:
                  widget.isClosed ? Alignment.center : Alignment.topCenter,
              children: [
                Opacity(
                  opacity: widget.isClosed ? 0.4 : 1,
                  child: Image.asset(
                      width: double.infinity,
                      AppImages.default_product_max,
                      fit: BoxFit.cover),
                ),
                widget.isClosed
                    ? Positioned(
                        child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            behavior: HitTestBehavior.opaque,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(AppIcon.schedule_icon),
                                  const SpaceWidth(width: 10),
                                  Text(scheduleOrder,
                                      style: const TextStyle(
                                          fontSize: AppSizes.size_14,
                                          fontWeight: AppFontWeight.w_400))
                                ],
                              ),
                            ),
                          ),
                          Text('$open 11:10',
                              style: const TextStyle(
                                color: Colors.white       ,
                                  fontSize: AppSizes.size_14,
                                  fontWeight: AppFontWeight.w_700)),
                        ],
                      ))
                    : Positioned(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //! agar apidan kelgan isOrdered true bo'ganda chiqadi
                            // isOrdered ?? false
                            //     ?
                            widget.isOrdered
                                ? Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25),
                                    decoration: BoxDecoration(
                                        color: greenColor,
                                        borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(50),
                                            bottomRight: Radius.circular(50))),
                                    child: Text('5 orders until \$8 reward',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: AppFontWeight.w_500,
                                            fontSize: AppSizes.size_14)),
                                  )
                                : const SizedBox.shrink(),
                            IconButton(
                                onPressed: () {
                                  isLiked = !isLiked;
                                  setState(() {});
                                },
                                icon: SvgPicture.asset(isLiked
                                    ? AppIcon.favourite_red
                                    : AppIcon.favourite_white))
                          ],
                        ),
                      )
              ]),
          const SpaceHeight(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Cardinal Chips',
                  style: const TextStyle(
                      fontSize: AppSizes.size_16,
                      fontWeight: AppFontWeight.w_500)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                decoration: ShapeDecoration(
                    color: greyColor, shape: const OvalBorder()),
                child: Text('4.4',
                    style: const TextStyle(
                        fontSize: AppSizes.size_12,
                        fontWeight: AppFontWeight.w_400)),
              )
            ],
          ),
          Text('\$0.29 Delivery Fee • 10-25 min',
              style: TextStyle(
                  fontSize: AppSizes.size_14,
                  color: itemSubtitleColor,
                  fontWeight: AppFontWeight.w_400)),
          const SpaceHeight(height: 25)
        ],
      ),
    );
  }
}
