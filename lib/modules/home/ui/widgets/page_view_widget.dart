import 'dart:async';
import 'package:restaurant_app/modules/global/imports/app_imports.dart';

class PageViewWidget extends StatefulWidget {
  final VoidCallback onTap;
  const PageViewWidget({super.key, required this.onTap});

  @override
  State<PageViewWidget> createState() => PageViewWidgetState();
}

class PageViewWidgetState extends State<PageViewWidget> {
  late PageController _pageController;
  int _currentPage = 0;
  late Timer _timer;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);

    _timer = Timer.periodic(const Duration(seconds: 7), (timer) {
      // 2 data length this is coming bloc state
      if (_currentPage < 2) {
        _currentPage++;
      } else if (_currentPage == _currentPage - 1) {
        _pageController.jumpToPage(_currentPage);
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(seconds: 2),
        curve: Curves.ease,
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: he(180), minHeight: he(170)),
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) {
                  _currentPage = value;
                  setState(() {});
                },
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: widget.onTap,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Image.asset(
                          AppImages.default_product_max,
                          fit: BoxFit.cover,
                        ),
                      ));
                },
                itemCount: 3),
          ),
          const SpaceHeight(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // i coming backend data length
              for (int i = 0; i < 3; i++)
                AnimatedContainer(
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                        color: _currentPage == i
                            ? const Color(0xff545454)
                            : const Color(0xffD9D9D9),
                        borderRadius: BorderRadius.circular(100)),
                    width: _currentPage == i ? 13 : 10,
                    height: _currentPage == i ? 13 : 10,
                    duration: const Duration(milliseconds: 300)),
            ],
          ),
        ],
      ),
    );
  }
}
