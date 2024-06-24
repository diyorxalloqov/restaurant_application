import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/core/constants/size/size_config.dart';

class SpaceHeight extends StatelessWidget {
  final double height;
  const SpaceHeight({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: he(height));
  }
}

class SpaceWidth extends StatelessWidget {
  final double width;
  const SpaceWidth({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: wi(width));
  }
}
