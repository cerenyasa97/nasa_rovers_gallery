import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rovers/core/components/image/svg_image.dart';
import 'package:rovers/core/constants/enums/tab_items.dart';
import 'package:rovers/core/extensions/string/string_extension.dart';
import 'package:rovers/core/extensions/theme/theme_extension.dart';

/// This widget just makes bottom navigation bar show and controls which tab tapped
class CustomBottomNavigation extends StatelessWidget {
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectedTab;
  final Map<TabItem, Widget> pageCreator;
  final Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys;

  const CustomBottomNavigation(
      {Key? key,
      required this.currentTab,
      required this.onSelectedTab,
      required this.pageCreator,
      required this.navigatorKeys})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // tabBar is a value related to the visibility of the bottom navigation menu
    // tabBuilder is a value related to the which data to shown
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          backgroundColor: Colors.white,
          border: Border.all(color: Colors.transparent),
          items: [
            _createNavItem(context, TabItem.CURIOSITY),
            _createNavItem(context, TabItem.OPPORTUNITY),
            _createNavItem(context, TabItem.SPIRIT)
          ],
          onTap: (index) => onSelectedTab(TabItem.values[index]),
        ),
        tabBuilder: (context, index) {
          final showingItem = TabItem.values[index];
          return CupertinoTabView(
            navigatorKey: navigatorKeys[showingItem],
            builder: (context) => pageCreator[showingItem]!,
          );
        });
  }

  BottomNavigationBarItem _createNavItem(
      BuildContext context, TabItem tabItem) {
    final TabItemData? currentTabData = TabItemData.allTabs[tabItem];

    return BottomNavigationBarItem(
      icon: SvgImage(
        imagePath: currentTabData!.icon!,
        color: currentTabData == TabItemData.allTabs[currentTab]
            ? context.themeData.primaryColor
            : null,
      ),
      label: currentTabData.title.locale,
    );
  }
}