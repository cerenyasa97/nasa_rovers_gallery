class Photo {
  Photo({
    required this.id,
    required this.sol,
    required this.camera,
    required this.imgSrc,
    required this.earthDate,
    required this.rover,
  });

  int id;
  int sol;
  Camera camera;
  String imgSrc;
  DateTime earthDate;
  PhotoRover rover;

  factory Photo.fromMap(Map<String, dynamic> json) => Photo(
    id: json["id"],
    sol: json["sol"],
    camera: Camera.fromMap(json["camera"]),
    imgSrc: json["img_src"],
    earthDate: DateTime.parse(json["earth_date"]),
    rover: PhotoRover.fromMap(json["rover"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "sol": sol,
    "camera": camera.toMap(),
    "img_src": imgSrc,
    "earth_date": "${earthDate.year.toString().padLeft(4, '0')}-${earthDate.month.toString().padLeft(2, '0')}-${earthDate.day.toString().padLeft(2, '0')}",
    "rover": rover.toMap(),
  };
}

class Camera {
  Camera({
    required this.id,
    required this.name,
    required this.roverId,
    required this.fullName,
  });

  int id;
  String name;
  int roverId;
  String fullName;

  factory Camera.fromMap(Map<String, dynamic> json) => Camera(
    id: json["id"],
    name: json["name"],
    roverId: json["rover_id"],
    fullName: json["full_name"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "rover_id": roverId,
    "full_name": fullName,
  };
}

class PhotoRover {
  PhotoRover({
    required this.id,
    required this.name,
    required this.landingDate,
    required this.launchDate,
    required this.status,
  });

  int id;
  String name;
  DateTime landingDate;
  DateTime launchDate;
  String status;

  factory PhotoRover.fromMap(Map<String, dynamic> json) => PhotoRover(
    id: json["id"],
    name: json["name"],
    landingDate: DateTime.parse(json["landing_date"]),
    launchDate: DateTime.parse(json["launch_date"]),
    status: json["status"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "landing_date": "${landingDate.year.toString().padLeft(4, '0')}-${landingDate.month.toString().padLeft(2, '0')}-${landingDate.day.toString().padLeft(2, '0')}",
    "launch_date": "${launchDate.year.toString().padLeft(4, '0')}-${launchDate.month.toString().padLeft(2, '0')}-${launchDate.day.toString().padLeft(2, '0')}",
    "status": status,
  };
}
