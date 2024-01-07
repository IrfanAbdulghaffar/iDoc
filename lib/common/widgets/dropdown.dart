import 'package:flutter/material.dart';

import '../../utils/app_constants.dart';
import '../../utils/color_constants.dart';

class DropdownValueCustom {
  final String value;
  final String id;
  DropdownValueCustom({required this.value, required this.id});
}

class CustomDropDown extends StatelessWidget {
  final Function(String) onPressed;
  CustomDropDown(this.value,{
    super.key,
    required this.items,
    required this.onPressed,
    this.title,
    this.titleTextStyle
  } );
  var value;
  String? title;
  List<String> items;
  final TextStyle? titleTextStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // title==null?SizedBox(): Padding(
        //   padding: const EdgeInsets.symmetric(vertical: 8.0),
        //   child: Text(title??"",
        //       style: titleTextStyle ??
        //           AppConstants.heading2.copyWith(color: ColorConstants.primary,fontWeight: FontWeight.bold)),
        // ),
        Container(
          padding: const EdgeInsets.only(left: 15),
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
              border: Border.all(width: 0, color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(10)),
          height: 50,
          child:
          Center(
            child: StatefulBuilder(builder: (context, StateSetter setState) {
              return DropdownButton<String>(
                value: value,
                elevation: 0,
                borderRadius: BorderRadius.circular(10),
                underline: const SizedBox(),
                hint:  Text(title??"select",style: TextStyle(fontSize: 16, color: Colors.grey),),
                isExpanded: true,
                itemHeight: null,
                icon: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: const Icon(Icons.expand_more,size: 24,),
                ),
                style: const TextStyle(fontSize: 18, color: Colors.black),
                onChanged: (newValue) {
                  setState(() {
                    value=newValue;
                    onPressed(value);
                  });
                },
                items: items.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style:AppConstants.heading2,
                    ),
                  );
                }).toList(),
              );
            }),
          ),
        ),
      ],
    );
  }
}