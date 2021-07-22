import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rovers/core/components/navigation_bar/custom_nav_bar.dart';
import 'package:rovers/core/constants/enums/tab_items.dart';
import 'package:rovers/core/constants/text/text_constants.dart';
import 'package:rovers/screens/curiosity/curiosity_gallery_screen.dart';
import 'package:rovers/screens/home_base/home_base_view_model/home_base_view_model.dart';
import 'package:rovers/screens/opportunity/opportunity_gallery_screen.dart';
import 'package:rovers/screens/spirit/spirit_gallery_screen.dart';
import 'package:rovers/core/extensions/string/string_extension.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  TabItem _currentTab = TabItem.CURIOSITY;

  Map<TabItem, Widget> allPages() {
    return {
      TabItem.CURIOSITY: CuriosityGalleryScreen(),
      TabItem.OPPORTUNITY: OpportunityGalleryScreen(),
      TabItem.SPIRIT: SpiritGalleryScreen(),
    };
  }

  Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys = {
    TabItem.CURIOSITY: GlobalKey<NavigatorState>(),
    TabItem.OPPORTUNITY: GlobalKey<NavigatorState>(),
    TabItem.SPIRIT: GlobalKey<NavigatorState>(),
  };

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // When you click the back button of the phone,
      // navigator stacks are controlled,
      // and if there is more than one page, the app returns the previous page,
      // but if there is one page in the stack, the app is closed.
      onWillPop: () async =>
          !await navigatorKeys[_currentTab]!.currentState!.maybePop(),
      child: CustomBottomNavigation(
          currentTab: _currentTab,
          onSelectedTab: (chosenTab) {
            var viewModel = Provider.of<HomeBaseViewModel>(context, listen: false);
            viewModel.clearPhotos();
            viewModel.getPhotos(TabItemData.allTabs[chosenTab]!.title.locale.toLowerCase(), TextConstants.CURIOSITY_TAB_TEXT[0].toLowerCase());
            // If you navigated the tab to another pages while you are in the users tab, you are not navigated to users page when you click current tab item.
            // To prevent this situation, you can add a control the stack and you delete stack's elements except first(bottom) element in the stack when you click the current tab again.
            // Thus, you are directed to the users page while you are in the users stack.
            if (chosenTab == _currentTab) {
              navigatorKeys[chosenTab]!
                  .currentState!
                  .popUntil((route) => route.isFirst);
            } else {
              setState(() {
                _currentTab = chosenTab;
              });
            }
          },
          pageCreator: allPages(),
          navigatorKeys: navigatorKeys),
    );
  }
}
