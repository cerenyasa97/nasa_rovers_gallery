import 'package:rovers/core/constants/text/text_constants.dart';
import 'package:rovers/core/init/languages/locale_keys.g.dart';
import 'package:rovers/screens/home_base/home_base_screen.dart';


class SpiritGalleryScreen extends HomeBaseView {
  @override
  _SpiritGalleryScreenState createState() => _SpiritGalleryScreenState();
}

class _SpiritGalleryScreenState extends HomeBaseState<SpiritGalleryScreen>{
  @override
  String pageTitle() => LocaleKeys.bottomNavTab3;


  @override
  List<String> tabText() => TextConstants.SPIRIT_TAB_TEXT;
}
