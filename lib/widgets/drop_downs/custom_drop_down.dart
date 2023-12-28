import 'package:flutter/material.dart';
import 'package:kublet/core/app_export.dart';
import 'package:kublet/core/utils/colour_constants.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    Key? key,
    this.alignment,
    this.width,
    this.focusNode,
    this.icon,
    this.title,
    this.autofocus = true,
    this.textStyle,
    this.items,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = true,
    this.validator,
    this.onChanged,
  }) : super(key: key);

  final Alignment? alignment;
  final double? width;
  final FocusNode? focusNode;
  final Widget? icon;
  final bool? autofocus;
  final TextStyle? textStyle;
  final List<SelectionPopupModel>? items;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? prefix;
  final BoxConstraints? prefixConstraints;
  final Widget? suffix;
  final BoxConstraints? suffixConstraints;
  final EdgeInsets? contentPadding;
  final InputBorder? borderDecoration;
  final Color? fillColor;
  final bool? filled;
  final String? title;
  final FormFieldValidator<SelectionPopupModel>? validator;
  final Function(SelectionPopupModel)? onChanged;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
      alignment: alignment ?? Alignment.center,
      child: dropDownWidget,
    )
        : dropDownWidget;
  }

  Widget get dropDownWidget => SizedBox(
    width: width ?? double.maxFinite,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(title!=null)
        Padding(
          padding: EdgeInsets.only(bottom: 10.v),
          child: Text(title??'', style: theme.textTheme.titleMedium),
        ),

        DropdownButtonFormField<SelectionPopupModel>(
          focusNode: focusNode ?? FocusNode(),
          icon: icon??Icon(Icons.arrow_drop_down_outlined,size:37.adaptSize,color: ColourConstants.lightGray,),
          autofocus: autofocus!,
          style: textStyle ?? theme.textTheme.titleMedium,
          items: items?.map((SelectionPopupModel item) {
            return DropdownMenuItem<SelectionPopupModel>(
              value: item,
              child: Text(
                item.title,
                overflow: TextOverflow.ellipsis,
                style: hintStyle ?? theme.textTheme.titleMedium,
              ),
            );
          }).toList(),
          decoration: decoration,
          validator: validator,
          onChanged: (value) {
            onChanged!(value!);
          },
        ),
      ],
    ),
  );

  InputDecoration get decoration => InputDecoration(
    hintText: hintText ?? "",
    hintStyle: hintStyle ?? theme.textTheme.titleMedium,
    prefixIcon: prefix,
    prefixIconConstraints: prefixConstraints,
    suffixIcon: suffix,
    suffixIconConstraints: suffixConstraints,
    isDense: true,
    contentPadding: contentPadding ??
        EdgeInsets.only(
          left: 12.h,
          top: 12.v,
          bottom: 12.v,
        ),
    fillColor: fillColor ?? theme.colorScheme.onPrimaryContainer,
    filled: filled,
    border: borderDecoration ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.h),
          borderSide: BorderSide.none,
        ),
    enabledBorder: borderDecoration ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.h),
          borderSide: BorderSide.none,
        ),
    focusedBorder: borderDecoration ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.h),
          borderSide: BorderSide.none,
        ),
  );
}
