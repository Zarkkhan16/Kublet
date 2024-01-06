import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:kublet/core/app_export.dart';
import 'package:kublet/core/utils/colour_constants.dart';
import 'package:kublet/presentation/apps_configuration_page/models/drop_down_data_model.dart';

class CustomDropDownSearch extends StatelessWidget {
  CustomDropDownSearch({
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

  // final List<SelectionPopupModel>? items;
  List<DropdownDataModel>? items;
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
  final FormFieldValidator<DropdownDataModel>? validator;
  final Function(DropdownDataModel)? onChanged;

  DropdownDataModel selectedValue=DropdownDataModel();

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
            if (title != null)
              Padding(
                padding: EdgeInsets.only(bottom: 10.v),
                child: Text(title ?? '', style: theme.textTheme.titleMedium),
              ),

            DropdownSearch<DropdownDataModel>(

                items: items!,
                dropdownBuilder: (cx,vl)
                {
                  return Text(selectedValue.name??'Select',
                    style: theme.textTheme.titleSmall,);
                },
                dropdownButtonProps: DropdownButtonProps(
                  color: ColourConstants.lightGray
                ),
                // selectedItem: selectedValue,
                onChanged: (v){
                  onChanged!(v!);
                  selectedValue=v;
                },



                popupProps: PopupProps.menu(
                  fit: FlexFit.loose,
                  menuProps: MenuProps(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                  emptyBuilder: (cx,vl)=>Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(
                            "No record Found",
                            textAlign: TextAlign.center,
                            style:theme.textTheme.titleSmall,),
                        ),
                      ],
                    ),
                  showSearchBox: true,
                  itemBuilder: _customPopupItemBuilderExample2,
                  searchFieldProps: TextFieldProps(
                    style: hintStyle ?? theme.textTheme.titleSmall,
                    decoration: _searchInputDecoration()
                  ) ,
                  containerBuilder: (ctx, popupWidget) {
                    return Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Container(
                        child: popupWidget,
                        color: theme.colorScheme.onPrimaryContainer,
                      ),
                    );
                  },
                ),


                filterFn: (suggestion, input) =>
                   suggestion.name!.toLowerCase().startsWith(input.toLowerCase()),

                dropdownDecoratorProps: _decorationProps()

            ),


          ],
        ),
      );

  Widget _customPopupItemBuilderExample2(
      BuildContext context, DropdownDataModel item, bool isSelected) {
    print(isSelected);
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: !isSelected
          ? null
          : BoxDecoration(
            color: Colors.white,
            ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(item.name!,
          style: theme.textTheme.titleSmall!.copyWith(
            height: 1.20,
          ),
        ),
      ),
    );
  }

  _decorationProps() {
    return DropDownDecoratorProps(
      dropdownSearchDecoration:_inputDecoration()
    );
  }
   _inputDecoration()
  {
    return InputDecoration(
      hintText: hintText ?? "",
      hintStyle: hintStyle ?? theme.textTheme.titleSmall,
      prefixIcon: prefix,
      prefixIconConstraints: prefixConstraints,
      suffixIcon: suffix,
      suffixIconConstraints: suffixConstraints,
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
  _searchInputDecoration()
  {
    return InputDecoration(
      hintText: "Search",
      hintStyle: hintStyle ?? theme.textTheme.titleMedium,
      prefixIcon: prefix,
      prefixIconConstraints: prefixConstraints,
      suffixIcon: suffix,
      suffixIconConstraints: suffixConstraints,
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
            borderSide: BorderSide(color:ColourConstants.gray),
          ),
      enabledBorder: borderDecoration ??
          OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.h),
            borderSide: BorderSide(color:ColourConstants.gray),
          ),
      focusedBorder: borderDecoration ??
          OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.h),
            borderSide: BorderSide(color:ColourConstants.gray),
          ),
    );
  }
}
