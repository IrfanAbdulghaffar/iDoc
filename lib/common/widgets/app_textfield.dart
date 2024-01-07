import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../utils/app_constants.dart';
import '../../utils/color_constants.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final int? maxLines;
  final String? hintText;
  final String title;
  final FocusNode? focusNode;
  final bool autofocus;
  final bool? isFilterScreen;
  final bool obscureText;
  final bool isWhite;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final Function()? onClick;
  final double titleSpacing;
  final double? fontSize;
  final Color? backgroundColor;
  final double? hintFontSize;
  final FontWeight? fontWeight;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final TextStyle? titleTextStyle;
  final bool noHeight;
  final bool readOnly;
  final Border? border;
  final bool bottomPedding;
  final double borderRadius;
  final TextStyle? style;
  final bool multiLine;
  final onField;

  final TextStyle? hintTextStyle;
  const AppTextFormField({
    Key? key,
    this.title = '',
    this.border,
    this.hintText,
    this.isFilterScreen = false,
    this.maxLines = 1,
    this.hintTextStyle,
    this.onClick,
    this.style,
    this.bottomPedding = true,
    this.hintFontSize,
    this.controller,
    this.isWhite=false,
    this.noHeight = false,
    this.focusNode,
    this.autofocus = false,
    this.readOnly=false,
    this.backgroundColor,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.validator,
    this.titleSpacing = 2,
    this.titleTextStyle,
    this.fontSize,
    this.fontWeight,
    this.textInputType,
    this.multiLine = false,
    this.borderRadius = 100,
    this.inputFormatters,
    this.onField,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.0),
            child: Text(title,
                style: titleTextStyle ??
                    AppConstants.heading2.copyWith(color: ColorConstants.black,fontWeight: FontWeight.bold)),
          ),
        if (title.isNotEmpty) SizedBox(height: titleSpacing),
        GestureDetector(
          onTap: onClick,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: title.isNotEmpty?0:3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              color: backgroundColor,
              border: border ??
                  Border.all(
                    color: isWhite?ColorConstants.white:ColorConstants.grey,
                  ),
            ),
            height: multiLine ? null : 46,
            padding: bottomPedding
                ? EdgeInsets.only(left: prefixIcon==null?15:0, bottom: 3,right: prefixIcon==null?15:0)
                : const EdgeInsets.only(left: 0, bottom: 3),
            alignment: Alignment.centerLeft,
            child: TextFormField(
              onFieldSubmitted: onField,
              maxLines: maxLines,
              controller: controller,
              autofocus: autofocus,
              focusNode: focusNode,
              onChanged: onChanged,
              style: style ?? AppConstants.heading2.copyWith(color: isWhite?Colors.white:Colors.black),
              validator: validator,
              obscureText: obscureText,
              textAlignVertical: TextAlignVertical.center,
              keyboardType: textInputType,
              inputFormatters: inputFormatters,
              readOnly: readOnly,
              decoration: InputDecoration(
                isDense: true,
                //filled: true,
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon==null?null:GestureDetector(
                    onTap: onClick,
                    child: suffixIcon),
                hintText: hintText,
                hintStyle: hintTextStyle ?? AppConstants.heading2.copyWith(color:isWhite?Colors.white.withOpacity(0.6): Colors.black.withOpacity(0.4),fontSize: 13),
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                // focusedBorder: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(8.w),
                //   borderSide: BorderSide(
                //     width: 2.0,
                //     color: AppColor.tagTextColor.withOpacity(0.1),
                //   ),
                // ),
                // enabledBorder: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(8.w),
                //   borderSide: BorderSide(
                //     width: 2.0,
                //     color: AppColor.tagTextColor.withOpacity(0.1),
                //   ),
                // ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
