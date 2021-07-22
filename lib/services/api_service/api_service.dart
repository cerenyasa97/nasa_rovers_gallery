import 'package:dio/dio.dart';
import 'package:rovers/core/constants/api_key/api_key.dart';
import 'package:rovers/screens/home_base/home_base_model/photo_model.dart';
import 'package:rovers/services/api_service/api_base.dart';
import 'package:rovers/screens/home_base/home_base_model/rover_model.dart';

class ApiService implements ApiBase{

  late int solDay;
  bool isLoading = true;
  int page = 0;
  List<Photo> photoList = [];

  clearData() {
    page = 0;
    photoList = [];
  }

  // Sends request to API
  @override
  Future<dynamic> getHttp(String url, {Map<String, dynamic>? parameters}) async{
    try{
      var response = await Dio().get(url, queryParameters: parameters);
      switch(response.statusCode){
        case 200:
          return response.data;
        case 404:
          return "Not found error please try again";
        case 400:
          return "Wrong http request";
        case 401:
          return "Wrong Api Key used";
        default:
          return "Nothing happened";
      }
    }catch(e){
      print("Api connection error: $e");
    }
  }

  // Makes requests to API to retrieve general information about the rover
  @override
  Future<Rover> getRoverInfo(String roverName) async {
    Map<String, dynamic> data = await getHttp("https://api.nasa.gov/mars-photos/api/v1/rovers/$roverName?", parameters: {"api_key" : NASA_API_KEY});
    Rover rover = Rover.fromMap(data["rover"]);
    solDay = rover.maxSol;
    return rover;
  }

  // In order to take the pictures taken by the rover, it sends a request to the API according to the camera type and rover name.
  @override
  Future<List<Photo>> getRoverImages(String roverName, String cameraType) async {
    isLoading = true;
    List<dynamic> photos = [];
    var gallery = await getHttp("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?", parameters: {"sol" : solDay, "api_key" : NASA_API_KEY, "page" : page});
    if(gallery != null)  photos = await gallery["photos"];
    print("Photos length in Api Service: ${photos.length}");
    if(photos.isNotEmpty){
      if(photos.length > 0) {
        page += 1;
        photos.forEach((photo) => photoList.add(Photo.fromMap(photo)));
        if(photos.length < 8){
          page += 1;
          return getRoverImages(roverName, cameraType);
        }
      }
    }else{
      if(solDay > 1) solDay -=1;
      page = 0;
      return getRoverImages(roverName, cameraType);
    }

    photos = [];
    isLoading = false;
    return photoList;
  }
}