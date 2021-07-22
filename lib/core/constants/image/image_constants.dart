class ImageConstants{
  static final ImageConstants _instance = ImageConstants._init();

  static ImageConstants get instance => _instance;

  ImageConstants._init();

  String path(text) => "assets/images/$text";

  String get loginVector => path("login_vector.svg");
  String get nasaGif => path("nasa.gif");
  String get appIntroVector1 => path("app_info_1.svg");
  String get appIntroVector2 => path("app_info_2.svg");
  String get googleLogin => path("google.svg");
  String get facebookLogin => path("facebook.svg");
  String get bottomNavIcon1 => path("bottom_nav_icon_1.svg");
  String get bottomNavIcon2 => path("bottom_nav_icon_2.svg");
  String get bottomNavIcon3 => path("bottom_nav_icon_3.svg");
}