class User {
  final String name;
  final String licensePlate;
  final String vehicleType;

  User(
      {required this.name,
      required this.licensePlate,
      required this.vehicleType});

  Map<String, dynamic> toJson() => {
        'name': name,
        'license_plate': licensePlate,
        'vehicle_type': vehicleType,
      };
}
