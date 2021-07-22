import 'package:rovers/core/constants/text/text_constants.dart';
import 'package:rovers/core/init/languages/locale_keys.g.dart';
import 'package:rovers/screens/home_base/home_base_screen.dart';

class CuriosityGalleryScreen extends HomeBaseView {
  @override
  _CuriosityGalleryScreenState createState() => _CuriosityGalleryScreenState();
}

class _CuriosityGalleryScreenState
    extends HomeBaseState<CuriosityGalleryScreen> {

  @override
  String pageTitle() => LocaleKeys.bottomNavTab1;

  @override
  List<String> tabText() => TextConstants.CURIOSITY_TAB_TEXT;
}