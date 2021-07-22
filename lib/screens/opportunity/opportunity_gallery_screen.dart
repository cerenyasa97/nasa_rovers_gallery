import 'package:rovers/core/constants/text/text_constants.dart';
import 'package:rovers/core/init/languages/locale_keys.g.dart';
import 'package:rovers/screens/home_base/home_base_screen.dart';

class OpportunityGalleryScreen extends HomeBaseView {
  @override
  _OpportunityGalleryScreenState createState() => _OpportunityGalleryScreenState();
}

class _OpportunityGalleryScreenState extends HomeBaseState<OpportunityGalleryScreen> {
  @override
  String pageTitle() => LocaleKeys.bottomNavTab2;


  @override
  List<String> tabText() => TextConstants.OPPRTUNITY_TAB_TEXT;
}
