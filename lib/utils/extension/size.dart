import 'package:flutter/cupertino.dart';

extension Sizes on BuildContext {
  double get height => MediaQuery.sizeOf(this).height;
  double get width => MediaQuery.sizeOf(this).width;
  double get bottom => MediaQuery.paddingOf(this).bottom;
  double get top => MediaQuery.paddingOf(this).top;
  double get left => MediaQuery.paddingOf(this).left;
  double get right => MediaQuery.paddingOf(this).right;
}
