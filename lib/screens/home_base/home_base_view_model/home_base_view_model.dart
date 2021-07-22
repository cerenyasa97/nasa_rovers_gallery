import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:rovers/core/constants/app/app_constants.dart';
import 'package:rovers/screens/home_base/home_base_model/photo_model.dart';
import 'package:rovers/services/api_service/api_service.dart';
import 'package:rovers/services/get_it/get_it_service.dart';

class HomeBaseViewModel extends ChangeNotifier {
  final Box<dynamic> galleryBox = Hive.box(AppConstants.HIVE_BOX_KEY);
  final ApiService apiService = locator<ApiService>();
  String? previousRoverName;
  String? previousCameraType;
  bool _isLoading = false;
  List<Photo> photoList = [];

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  clearPhotos() {
    if (previousRoverName != null || previousCameraType != null) {
      galleryBox.put(previousRoverName, photoList);
      galleryBox.put(previousRoverName! + " page", apiService.page);
    }
    photoList.clear();
    notifyListeners();
  }

  Future<void> getPhotos(String roverName, String cameraType) async {
    if ((roverName != previousRoverName && previousRoverName != null) || (previousCameraType != null && cameraType != previousCameraType)) {
      final photoListFromBox = galleryBox.get(roverName);
      if (photoListFromBox != null && photoList.isNotEmpty) {
        photoList = photoListFromBox;
        apiService.page = galleryBox.get(roverName + " page");
      }
    }
    await sendRequestToAPI(cameraType, roverName);
  }

  Future<void> sendRequestToAPI(String cameraType, String roverName) async {
    previousCameraType = cameraType;
    previousRoverName = roverName;
    isLoading = true;
    apiService.clearData();
    await apiService.getRoverInfo(roverName.toLowerCase());
    photoList.addAll(await apiService
        .getRoverImages(roverName.toLowerCase(), cameraType.toLowerCase()));
    isLoading = false;
  }
}
