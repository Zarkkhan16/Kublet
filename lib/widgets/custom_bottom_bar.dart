import 'package:flutter/material.dart';
import 'package:kublet/core/app_export.dart';
import 'package:kublet/data/enum/bottom_bar_enum.dart';

class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({this.onChanged});

  Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar> {
  int selectedIndex = 0;

  List<BottomMenuModel> bottomMenuList = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: double.maxFinite,
          child: Divider(),
        ),
        SizedBox(
          height: 55.v,
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedFontSize: 0,
            elevation: 0,
            currentIndex: selectedIndex,
            type: BottomNavigationBarType.fixed,
            items: List.generate(bottomMenuList.length, (index) {
              return BottomNavigationBarItem(
                icon: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 28.v,
                      width: 24.h,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [

                          CustomImageView(
                            imagePath:selectedIndex==index
                            ?bottomMenuList[index].activeIcon:
                            bottomMenuList[index].icon,
                            height: 28.v,
                            width: 24.h,
                            alignment: Alignment.center,
                          ),
                        ],
                      ),
                    ),
                    Text( bottomMenuList[index].title ?? "",
                            style: theme.textTheme.labelMedium!.copyWith(
                              color: appTheme.blueGray,
                            ),
                          ),

                  ],
                ),
                activeIcon: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomImageView(
                      imagePath: bottomMenuList[index].activeIcon,
                      height: 24.v,
                      width: 28.h,
                      color: theme.colorScheme.onPrimary,
                      alignment: Alignment.center,
                    ),
                    Text(
                      bottomMenuList[index].title ?? "",
                      style: theme.textTheme.labelMedium!.copyWith(
                        color: appTheme.blueGray,
                      ),
                    ),

                  ],
                ),
                label: '',
              );
            }),
            onTap: (index) {
              selectedIndex = index;
              widget.onChanged?.call(bottomMenuList[index].type);
              setState(() {});
            },
          ),
        ),
      ],
    );
  }
}

// enum BottomBarEnum {
//   Home,
//   Mykublets,
//   Settings,
// }

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    this.title,
    required this.type,
  });

  String icon;

  String activeIcon;

  String? title;

  BottomBarEnum type;
}

