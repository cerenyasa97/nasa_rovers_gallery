import 'package:rovers/core/constants/image/image_constants.dart';
import 'package:rovers/core/init/languages/locale_keys.g.dart';

enum TabItem { CURIOSITY, OPPORTUNITY, SPIRIT}

class TabItemData {
  final String title;
  final String? icon;

  TabItemData(this.title, this.icon);

  static Map<TabItem, TabItemData> allTabs = {
    TabItem.CURIOSITY:
        TabItemData(LocaleKeys.bottomNavTab1, ImageConstants.instance.bottomNavIcon1),
    TabItem.OPPORTUNITY:
        TabItemData(LocaleKeys.bottomNavTab2, ImageConstants.instance.bottomNavIcon2),
    TabItem.SPIRIT:
        TabItemData(LocaleKeys.bottomNavTab3, ImageConstants.instance.bottomNavIcon3),
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TabItemData &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          icon == other.icon;

  @override
  int get hashCode => title.hashCode ^ icon.hashCode;
}
