class Division {
  Division({
    this.id,
    this.name,
    this.namebn,
    this.lat,
    this.long,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? namebn;
  String? lat;
  String? long;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Division.fromJson(Map<String, dynamic> json) => Division(
        id: json["id"],
        name: json["name"],
        namebn: json["namebn"],
        lat: json["lat"].toString(),
        long: json["long"].toString(),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "namebn": namebn,
        "lat": lat,
        "long": long,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
