import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:rovers/core/components/segmented_control/custom_segmented_control.dart';
import 'package:rovers/core/components/text/project_text_locale.dart';
import 'package:rovers/core/constants/app/app_constants.dart';
import 'package:rovers/core/extensions/context/context_extension.dart';
import 'package:rovers/core/extensions/date_time_extension/date_time_extension.dart';
import 'package:rovers/core/extensions/string/string_extension.dart';
import 'package:rovers/core/extensions/theme/theme_extension.dart';
import 'package:rovers/core/init/languages/locale_keys.g.dart';
import 'package:rovers/core/init/navigation/navigation_service.dart';
import 'package:rovers/screens/home_base/home_base_model/photo_model.dart';
import 'package:rovers/screens/home_base/home_base_view_model/home_base_view_model.dart';
import 'package:rovers/screens/login/view_model/login_view_model.dart';
import 'package:share_plus/share_plus.dart';

abstract class HomeBaseView extends StatefulWidget {
  HomeBaseView({Key? key}) : super(key: key);
}

abstract class HomeBaseState<Page extends HomeBaseView> extends State<Page> {
  final ValueNotifier<int> tabValue = ValueNotifier<int>(0);
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () => getPhoto());
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.offset >=
                scrollController.position.maxScrollExtent &&
            !scrollController.position.outOfRange) {
          getPhoto();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: Colors.transparent,
          border: Border.all(color: Colors.transparent),
          leading: Padding(
            padding: context.navigationBarPadding,
            child: ProjectTextLocale(
              text: pageTitle(),
              style: context.textTheme.textStyle.copyWith(fontSize: 18),
            ),
          ),
          trailing: TextButton(
            child: ProjectTextLocale(
              text: LocaleKeys.signOutButton,
            ),
            onPressed: () =>
                Provider.of<LoginViewModel>(context, listen: false).signOut(),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: context.dynamicHeight(50)),
          child: ValueListenableBuilder<int>(
            valueListenable: tabValue,
            builder: (context, value, child) => Column(
              children: [
                CustomSegmentedControl(
                  tabText: tabText(),
                  currentValue: value,
                  onValueChanged: (index) async {
                    tabValue.value = index ?? 0;
                    Provider.of<HomeBaseViewModel>(context, listen: false)
                        .clearPhotos();
                    getPhoto();
                  },
                ),
                Expanded(child: imagesStaggeredView)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Consumer<HomeBaseViewModel> get imagesStaggeredView {
    return Consumer<HomeBaseViewModel>(
      builder: (context, snapshot, child) {
        return snapshot.photoList.isEmpty && snapshot.isLoading
            ? showProgressIndicator()
            : Column(
                children: [
                  Expanded(
                    child: StaggeredGridView.countBuilder(
                        controller: scrollController,
                        padding: EdgeInsetsDirectional.all(10),
                        crossAxisCount: AppConstants.STAGGARED_CROSS_AXIS_COUNT,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 12,
                        itemCount: snapshot.photoList.length,
                        itemBuilder: (context, index) {
                          return Hero(
                              tag: index,
                              child: GestureDetector(
                                onTap: () => _showImageDialog(
                                    snapshot.photoList[index], index),
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  child: Image.network(
                                      snapshot.photoList[index].imgSrc,
                                      fit: BoxFit.fitWidth),
                                ),
                              ));
                        },
                        staggeredTileBuilder: (index) {
                          return StaggeredTile.fit(1);
                        }),
                  ),
                  Visibility(
                    child: Container(
                      height: context.dynamicHeight(50),
                      child: showProgressIndicator(),
                    ),
                    visible: snapshot.isLoading,
                  )
                ],
              );
      },
    );
  }

  String pageTitle();

  List<String> tabText();

  _showImageDialog(Photo photo, int index) {
    return showCupertinoDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return Hero(
              tag: index,
              child: Container(
                color: Colors.black.withOpacity(0.2),
                child: Center(
                  child: Container(
                    color: Colors.white,
                    width: context.dynamicWidth(325),
                    padding: context.pageEdgeInsets,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.network(
                          photo.imgSrc,
                          fit: BoxFit.fitWidth,
                        ),
                        context.lowHeightSizedBox,
                        Text(photo.earthDate.date),
                        //context.lowHeightSizedBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CupertinoButton(
                                onPressed: () =>
                                    FlutterClipboard.copy(photo.imgSrc),
                                child: Icon(Icons.copy)),
                            CupertinoButton(
                                child: Icon(Icons.share),
                                onPressed: () => Share.share(photo.imgSrc)),
                            CupertinoButton(
                                child: Icon(Icons.close),
                                onPressed: () => NavigationService.instance
                                    .navigatorPop(context))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ));
        });
  }

  void getPhoto() {
    Provider.of<HomeBaseViewModel>(context, listen: false)
        .getPhotos(pageTitle().locale, tabText()[tabValue.value]);
  }

  showProgressIndicator() {
    return Center(
      child: CupertinoActivityIndicator(),
    );
  }
}
