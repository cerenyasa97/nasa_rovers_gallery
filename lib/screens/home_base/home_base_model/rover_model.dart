class Rover {
  Rover({
    required this.id,
    required this.name,
    required this.landingDate,
    required this.launchDate,
    required this.status,
    required this.maxSol,
    required this.maxDate,
    required this.totalPhotos,
    required this.cameras,
  });

  int id;
  String name;
  DateTime landingDate;
  DateTime launchDate;
  String status;
  int maxSol;
  DateTime maxDate;
  int totalPhotos;
  List<Camera> cameras;

  factory Rover.fromMap(Map<String, dynamic> json) => Rover(
    id: json["id"],
    name: json["name"],
    landingDate: DateTime.parse(json["landing_date"]),
    launchDate: DateTime.parse(json["launch_date"]),
    status: json["status"],
    maxSol: json["max_sol"],
    maxDate: DateTime.parse(json["max_date"]),
    totalPhotos: json["total_photos"],
    cameras: List<Camera>.from(json["cameras"].map((x) => Camera.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "landing_date": "${landingDate.year.toString().padLeft(4, '0')}-${landingDate.month.toString().padLeft(2, '0')}-${landingDate.day.toString().padLeft(2, '0')}",
    "launch_date": "${launchDate.year.toString().padLeft(4, '0')}-${launchDate.month.toString().padLeft(2, '0')}-${launchDate.day.toString().padLeft(2, '0')}",
    "status": status,
    "max_sol": maxSol,
    "max_date": "${maxDate.year.toString().padLeft(4, '0')}-${maxDate.month.toString().padLeft(2, '0')}-${maxDate.day.toString().padLeft(2, '0')}",
    "total_photos": totalPhotos,
    "cameras": List<dynamic>.from(cameras.map((x) => x.toMap())),
  };
}

class Camera {
  Camera({
    required this.name,
    required this.fullName,
  });

  String name;
  String fullName;

  factory Camera.fromMap(Map<String, dynamic> json) => Camera(
    name: json["name"],
    fullName: json["full_name"],
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "full_name": fullName,
  };
}
