import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rovers/core/components/button/project_cupertino_button.dart';
import 'package:rovers/core/components/image/svg_image.dart';
import 'package:rovers/core/components/text/project_text_locale.dart';
import 'package:rovers/core/constants/color/color_constants.dart';
import 'package:rovers/core/constants/image/image_constants.dart';
import 'package:rovers/core/extensions/context/context_extension.dart';
import 'package:rovers/core/init/languages/locale_keys.g.dart';
import 'package:rovers/screens/login/model/user_model.dart';
import 'package:rovers/screens/login/view_model/login_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        resizeToAvoidBottomInset: false,
        child: SafeArea(
          child: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 4,
                  child: SvgImage(
                    width: double.maxFinite,
                    imagePath: ImageConstants.instance.loginVector,
                  ),
                ),
                Flexible(
                    flex: 2,
                    child: Container(
                      width: context.dynamicWidth(300),
                      child: Column(
                        children: [
                          _getChild(ImageConstants.instance.googleLogin,
                              LocaleKeys.continueWithGoogle, () async {
                            UserModel? res = await Provider.of<LoginViewModel>(context, listen: false).signInWithGoogle();
                            if (res != null) print(res.userID);
                          }),
                          context.lowHeightSizedBox,
                          _getChild(ImageConstants.instance.facebookLogin,
                              LocaleKeys.continueWithFacebook, () async {
                                UserModel? res = await Provider.of<LoginViewModel>(context, listen: false).signInWithFacebook();
                                if (res != null) print(res.userID);
                              })
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ));
  }

  _getChild(String image, String text, Function() onPressed) {
    return ProjectCupertinoButton(
        isCircularCorner: true,
        padding: context.verticalLowEdgeInsets,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgImage(imagePath: image, height: context.dynamicHeight(35)),
            context.lowWidthSizedBox,
            ProjectTextLocale(text: text),
          ],
        ),
        buttonColor: ColorConstants.buttonColor,
        onPressed: onPressed);
  }
}
/*
CupertinoPageScaffold(
        resizeToAvoidBottomInset: false,
        child: SafeArea(
          child: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 4,
                  child: SvgImage(
                    width: double.maxFinite,
                    imagePath: ImageConstants.instance.loginVector,
                  ),
                ),
                Flexible(
                    flex: 2,
                    child: Consumer<LoginViewModel>(
                      builder: (context, snapshot, child){
                        return Container(
                      width: context.dynamicWidth(300),
                      child: Column(
                        children: [
                          _getChild(
                              ImageConstants.instance.googleLogin,
                              LocaleKeys.continueWithGoogle,
                                  () async {
                                UserModel? res =
                                await snapshot.signInAnonymously();
                                NavigationService.instance
                                    .navigatePush(context, Screens.HOME);
                                if (res != null) print(res.userID);
                              }),
                          context.lowHeightSizedBox,
                          _getChild(
                              ImageConstants.instance.facebookLogin,
                              LocaleKeys.continueWithFacebook,
                                  () {})
                        ],
                      ),
                    );})),
              ],
            ),
          ),
        ));
 */
