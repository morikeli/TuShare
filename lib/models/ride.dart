class Ride {
  final String id, driverName, driverProfilePic, vehicleType, vehicleModel, vehiclePlate, departureLocation, destination, departureTime;
  final int availableSeats, pricePerSeat;
  final List<Passenger> passengers;

  Ride({
    required this.id,
    required this.driverName,
    required this.driverProfilePic,
    required this.vehicleType,
    required this.vehicleModel,
    required this.vehiclePlate,
    required this.availableSeats,
    required this.departureLocation,
    required this.destination,
    required this.departureTime,
    required this.pricePerSeat,
    required this.passengers,
  });

  factory Ride.fromJson(Map<String, dynamic> json) {
    return Ride(
      id: json['id'],
      driverName: json['driver_name'],
      driverProfilePic: json['driver_profile_image'],
      vehicleType: json['vehicle_type'],
      vehicleModel: json['vehicle_model'] ?? "Unknown Model",
      vehiclePlate: json['vehicle_plate'],
      availableSeats: json['available_seats'],
      departureLocation: json['departure_location'],
      destination: json['destination'],
      departureTime: json['departure_time'],
      pricePerSeat: json['price_per_seat'].toInt(),
      passengers: (json['passengers'] as List)
          .map((p) => Passenger.fromJson(p))
          .toList(),
    );
  }
}

class Passenger {
  final String name;
  final String profilePic;
  final String pickupPoint;

  Passenger({
    required this.name,
    required this.profilePic,
    required this.pickupPoint,
  });

  factory Passenger.fromJson(Map<String, dynamic> json) {
    return Passenger(
      name: json['name'],
      profilePic: json['profile_image'],
      pickupPoint: json['departure_location'],    // pickup point
    );
  }
}
