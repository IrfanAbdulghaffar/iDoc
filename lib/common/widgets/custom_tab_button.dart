import 'package:flutter/material.dart';

import '../../utils/color_constants.dart';

class CustomTabButton extends StatelessWidget {
  final int index;
  final int currentPage;
  final String text;
  final VoidCallback onTap;

  CustomTabButton({
    required this.index,
    required this.currentPage,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 50,
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 20,
          ),
          decoration: BoxDecoration(
            color: currentPage == index
                ? ColorConstants.secondary // Active button color
                : const Color(0xffe4e8e9), // Inactive button color
            borderRadius: BorderRadius.only(
              topLeft: index == 0 ? Radius.circular(10.0) : Radius.circular(0.0),
              topRight: index == 1 ? Radius.circular(10.0) : Radius.circular(0.0),
              bottomLeft:
              index == 0 ? Radius.circular(10.0) : Radius.circular(0.0),
              bottomRight:
              index == 1 ? Radius.circular(10.0) : Radius.circular(0.0),
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: currentPage == index ? Colors.white : Colors.black,
                fontWeight: currentPage == index
                    ? FontWeight.bold
                    : FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}



class CustomTabButton1 extends StatelessWidget {
  final int index;
  final int currentPage;
  final String text;
  final PageController pageController;
  final VoidCallback onTap;

  CustomTabButton1({
    required this.index,
    required this.currentPage,
    required this.text,
    required this.pageController,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 50,
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 20,
          ),
          decoration: BoxDecoration(
            color: currentPage == index
                ? ColorConstants.secondary
                : const Color(0xffe4e8e9),
            borderRadius: BorderRadius.only(
              topLeft: index == 0 ? Radius.circular(10.0) : Radius.circular(0.0),
              topRight: index == 2 ? Radius.circular(10.0) : Radius.circular(0.0),
              bottomLeft: index == 0 ? Radius.circular(10.0) : Radius.circular(0.0),
              bottomRight: index == 2 ? Radius.circular(10.0) : Radius.circular(0.0),
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: currentPage == index ? Colors.white : Colors.black,
                fontWeight: currentPage == index ? FontWeight.bold : FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

