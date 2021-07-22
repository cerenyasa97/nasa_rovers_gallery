import 'package:rovers/screens/home_base/home_base_model/photo_model.dart';
import 'package:rovers/screens/home_base/home_base_model/rover_model.dart';

abstract class ApiBase{
  /// Sends request to API
  Future<dynamic>? getHttp(String url, {Map<String, dynamic>? parameters}){}
  /// Makes requests to API to retrieve general information about the rover
  Future<Rover>? getRoverInfo(String roverName){}
  /// In order to take the pictures taken by the rover, it sends a request to the API according to the camera type and rover name.
  Future<List<Photo>>? getRoverImages(String roverName, String cameraType){}
}