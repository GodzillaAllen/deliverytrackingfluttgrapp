class AcceptedOrder {
  final int? deliveryId;
  final int customerId;
  final int courierId;
  final String acceptedTime;
  final String departureTime;
  final String arrivalTime;
  final String orderNumber;
  final String status;

  AcceptedOrder({
    this.deliveryId,
    required this.customerId,
    required this.courierId,
    required this.acceptedTime,
    required this.departureTime,
    required this.arrivalTime,
    required this.orderNumber,
    required this.status,
  });

  factory AcceptedOrder.fromMap(Map<String, dynamic> json) => AcceptedOrder(
        deliveryId: json['delivery_id'],
        customerId: json['customer_id'],
        courierId: json['courier_id'],
        acceptedTime: json['accepted_time'],
        departureTime: json['departure_time'],
        arrivalTime: json['arrival_time'],
        orderNumber: json['orderNumber'],
        status: json['status'],
      );

  Map<String, dynamic> toMap() {
    return {
      'delivery_id': deliveryId,
      'customer_id': customerId,
      'courier_id': courierId,
      'accepted_time': acceptedTime,
      'departure_time': departureTime,
      'arrival_time': arrivalTime,
      'orderNumber': orderNumber,
      'status': status,
    };
  }
}
