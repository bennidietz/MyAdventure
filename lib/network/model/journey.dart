import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:latlong2/latlong.dart';

class MyJourney {
  final String? id;
  final String title;
  final String description;
  final String? image_url;
  final String? date;
  final double latitude;
  final double longitude;

  LatLng get latlng => LatLng(latitude, longitude);

  MyJourney({
    this.id,
    required this.title,
    required this.description,
    this.image_url,
    this.date,
    required this.latitude,
    required this.longitude,
  });

  MyJourney.fromJson(Map<String, Object?> json, String id)
      : this(
    id: id,
    title: json['title']! as String,
    description: json['description']! as String,
    image_url: json['image_url']! as String,
    date: json['date'] as String?,
    latitude: json['latitude']! as double,
    longitude: json['longitude']! as double,
  );

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'image_url': image_url,
      'date': date,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

}

final journeyRef = FirebaseFirestore.instance.collection('travel_journeys').withConverter<MyJourney>(
  fromFirestore: (snapshot, _) => MyJourney.fromJson(
      snapshot.data()!, snapshot.id
  ),
  toFirestore: (movie, _) => movie.toJson(),
);