import 'package:flutter/material.dart';

Future<void> showCustomBottomSheet(context,Widget body) async {

  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft:Radius.circular(20) ,topRight: Radius.circular(20))
          ),
          child: body,
        );
      });
}