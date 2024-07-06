class Delivery {
  final int id;
  final String description;
  final double latitude;
  final double longitude;

  Delivery(
      {required this.id,
      required this.description,
      required this.latitude,
      required this.longitude});

  // Add fromMap and toMap methods if needed for database operations
}
