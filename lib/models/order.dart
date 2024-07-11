class Order {
  final int? id;
  final int userId;
  final String orderNumber;
  final String userPhoneNumber;
  final String userLocation;
  final String orderDate;
  final String orderDestination;

  Order({
    this.id,
    required this.userId,
    required this.orderNumber,
    required this.userPhoneNumber,
    required this.userLocation,
    required this.orderDate,
    required this.orderDestination,
  });

  factory Order.fromMap(Map<String, dynamic> json) => Order(
        id: json['id'],
        userId: json['userId'],
        orderNumber: json['orderNumber'],
        userPhoneNumber: json['userPhoneNumber'],
        userLocation: json['userLocation'],
        orderDate: json['orderDate'],
        orderDestination: json['orderDestination'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'orderNumber': orderNumber,
      'userPhoneNumber': userPhoneNumber,
      'userLocation': userLocation,
      'orderDate': orderDate,
      'orderDestination': orderDestination,
    };
  }
}
