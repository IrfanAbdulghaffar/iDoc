import 'package:flutter/material.dart';
import '../../main.dart';
import '../../utils/app_constants.dart';
import '../../utils/color_constants.dart';
import '../../utils/extensions.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    required this.title,
    this.home = false,
    this.actionButton,
    this.leading,
  }) : super(key: key);
  final String title;
  final bool home;
  final Widget? leading;
  List<Widget>? actionButton=[];

  @override
  Widget build(BuildContext context) {
    return AppBar(

      flexibleSpace:Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: const Offset(
                1.0,
                1.0,
              ),
              blurRadius: 4.0,
              spreadRadius: 1.0,
            ),

          ],
          gradient: LinearGradient(
              colors: [
                ColorConstants.white,
                ColorConstants.white
              ]
          ),
        ),
      ),
      elevation: 2,
      title: Text(title, style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500
      ),),
      leading: leading ?? (home
          ? InkWell(
        onTap:      (){   },
        child: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
      )
          : InkWell(
        onTap: () {
          navigatorKey.currentState?.pop();
        },
        child: GestureDetector(
          onTap: (){navigatorKey.currentState?.pop();},
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      )),
      actions: actionButton,
      backgroundColor: ColorConstants.primary,
      centerTitle: true,
      titleTextStyle: AppConstants.heading1,
    );
  }

  @override
  Size get preferredSize => const Size(0, 56);
}
