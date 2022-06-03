class Place {
  String placeId;
  String placeName;

  Place({
    required this.placeId,
    required this.placeName,
  });

  factory Place.fromJson(Map<String, dynamic> json) => Place(
        placeId: json['place_id'],
        placeName: json['place_name'],
      );
}
