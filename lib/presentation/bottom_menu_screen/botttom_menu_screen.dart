import 'package:flutter/material.dart';
import 'package:kublet/core/app_export.dart';
import 'package:kublet/presentation/bottom_menu_screen/notifier/bottom_menu_notifier.dart';

class BottomMenuScreen extends ConsumerWidget {

  BottomMenuScreen({this.onChanged});

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  Function(Enum)? onChanged=(_){};

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    var model = ref.watch(bottomMenuNotifier);
    var controller = ref.watch(bottomMenuNotifier.notifier);
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
            fixedColor: Colors.white.withOpacity(0.55),
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedFontSize: 0,
            elevation: 0,
            currentIndex: model.selectedIndex,
            type: BottomNavigationBarType.fixed,
            items: List.generate(model.bottomMenuList.length, (index) {
              return BottomNavigationBarItem(
                icon: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomImageView(
                      imagePath: model.bottomMenuList[index].icon,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        model.bottomMenuList[index].title ?? "",
                        style: theme.textTheme.labelMedium!.copyWith(
                          color: appTheme.blueGray,
                        ),
                      ),
                    ),
                  ],
                ),
                activeIcon: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomImageView(
                      imagePath: model.bottomMenuList[index].activeIcon,
                      height: 24,
                      width: 24,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        model.bottomMenuList[index].title ?? "",
                        style: theme.textTheme.labelMedium!.copyWith(
                          color: appTheme.blueGray,
                        ),
                      ),
                    ),
                  ],
                ),
                label: "",
              );
            }),
            onTap: (index) {
              print("onTap: $index");
              controller.updateIndex(index);

              if (onChanged != null &&
                  model.bottomMenuList != null &&
                  model.bottomMenuList.isNotEmpty) {
                onChanged!(model.bottomMenuList[index].type);
              }
            },
          ),
        ),
      ],
    );

  }

}
