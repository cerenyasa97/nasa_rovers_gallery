import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rovers/core/components/button/circular_next_button.dart';
import 'package:rovers/core/components/button/project_cupertino_button.dart';
import 'package:rovers/core/components/indicator/transition_indicator_dot.dart';
import 'package:rovers/core/components/methods/scroll_widget_behavior.dart';
import 'package:rovers/core/constants/enums/screens/screens.dart';
import 'package:rovers/core/constants/image/image_constants.dart';
import 'package:rovers/core/init/languages/locale_keys.g.dart';
import 'package:rovers/core/extensions/context/context_extension.dart';
import 'package:rovers/core/init/navigation/navigation_service.dart';
import 'app_intro_page_view.dart';
import 'package:rovers/core/extensions/theme/theme_extension.dart';

class AppInfoScreen extends StatefulWidget {
  AppInfoScreen({Key? key}) : super(key: key);

  @override
  _AppInfoScreenState createState() => _AppInfoScreenState();
}

class _AppInfoScreenState extends State<AppInfoScreen> {
  final PageController pageController = PageController(initialPage: 0);

  ValueNotifier<int> _pageIndex = ValueNotifier<int>(0);

  final List<Widget> pageList = [
    AppIntroPageView(
        imagePath: ImageConstants.instance.appIntroVector1,
        title: LocaleKeys.appInfoTitle1,
        description: LocaleKeys.appInfoDescription1),
    AppIntroPageView(
        imagePath: ImageConstants.instance.appIntroVector2,
        title: LocaleKeys.appInfoTitle2,
        description: LocaleKeys.appInfoDescription2)
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        resizeToAvoidBottomInset: false,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
              child: Padding(
            padding: context.pageEdgeInsets,
            child: ScrollConfiguration(
              behavior: MyBehavior(),
              child: ValueListenableBuilder<int>(
                valueListenable: _pageIndex,
                builder: (context, value, child) => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                          width: double.infinity,
                          alignment: Alignment.centerRight,
                          child: ProjectCupertinoButton(
                            text: LocaleKeys.skipButton,
                            textColor:
                                context.themeData.primaryContrastingColor,
                            textSize: 18,
                            onPressed: () => _navigateToLogin(),
                          )),
                    ),
                    Expanded(
                      flex: 6,
                      child: Container(
                        width: double.infinity,
                        height: context.dynamicHeight(600),
                        child: PageView(
                          controller: pageController,
                          onPageChanged: (currentPage) {
                            _pageIndex.value = currentPage;
                          },
                          scrollDirection: Axis.horizontal,
                          children: pageList,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            pageList.length,
                            (index) => TransitionIndicatorDot(
                              currentPageIndex: value,
                              currentContainerIndex: index,
                              selectedColor: context.themeData.primaryColor,
                              unselectedColor: context.themeData.primaryColor,
                            ),
                          ),
                        ),
                      ),
                      flex: 1,
                    ),
                    Flexible(
                      child: Align(
                          alignment: Alignment.center,
                          child: CircularNextButton(
                            innerRadius: 10,
                            outerRadius: 15,
                            onTap: () {
                              if (value != pageList.length - 1) {
                                value += 1;
                                pageController.animateToPage(value,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.easeInOut);
                              } else
                                _navigateToLogin();
                            },
                          )),
                      flex: 2,
                    )
                  ],
                ),
              ),
            ),
          )),
        ));
  }

  _navigateToLogin() =>
      NavigationService.instance.navigatePush(context, Screens.LANDING);
}
