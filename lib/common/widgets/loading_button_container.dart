import 'package:flutter/material.dart';
import '../../utils/color_constants.dart';

class LoadingButtonContainer extends StatelessWidget {
  const LoadingButtonContainer(
      {Key? key,
      this.borderRadius = 8,
      this.height = 45,
      this.width,
      this.bgColor})
      : super(key: key);
  final double? height;
  final double? width;
  final double borderRadius;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: bgColor ?? ColorConstants.buttonBlue,
      ),
      alignment: Alignment.center,
      child: const CircularProgressIndicator(
        color: Colors.white,
      ),
    );
  }
}
