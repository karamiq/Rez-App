class Party {
  String id;
  bool deleted;
  DateTime creationDate;
  String name;
  String description;
  double price;
  int numberOfRooms;
  double space;
  List<StorageFeature> storageFeatures;
  double latitude;
  double longitude;
  String address;
  List<String> images;
  bool isBookmarked;
  double distance;
  double rating;

  Party({
    required this.id,
    required this.deleted,
    required this.creationDate,
    required this.name,
    required this.description,
    required this.price,
    required this.numberOfRooms,
    required this.space,
    required this.storageFeatures,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.images,
    required this.isBookmarked,
    required this.distance,
    required this.rating,
  });

  factory Party.fromJson(Map<String, dynamic> json) {
    return Party(
      id: json['id'],
      deleted: json['deleted'],
      creationDate: DateTime.parse(json['creationDate']),
      name: json['name'],
      description: json['description'],
      price: json['price'],
      numberOfRooms: json['numberOfRooms'],
      space: json['space'],
      storageFeatures: (json['storageFeatures'] as List)
          .map((i) => StorageFeature.fromJson(i))
          .toList(),
      latitude: json['latitude'],
      longitude: json['longitude'],
      address: json['address'],
      images: List<String>.from(json['images']),
      isBookmarked: json['isBookmarked'],
      distance: json['distance'],
      rating: json['rating'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'deleted': deleted,
      'creationDate': creationDate.toIso8601String(),
      'name': name,
      'description': description,
      'price': price,
      'numberOfRooms': numberOfRooms,
      'space': space,
      'storageFeatures': storageFeatures.map((i) => i.toJson()).toList(),
      'latitude': latitude,
      'longitude': longitude,
      'address': address,
      'images': images,
      'isBookmarked': isBookmarked,
      'distance': distance,
      'rating': rating,
    };
  }
}

class StorageFeature {
  String id;
  String name;

  StorageFeature({
    required this.id,
    required this.name,
  });

  factory StorageFeature.fromJson(Map<String, dynamic> json) {
    return StorageFeature(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  bool isEmpty() {
    return id.isEmpty && name.isEmpty;
  }
}
