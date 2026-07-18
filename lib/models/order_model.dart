class Order {
  final String id;
  final String userId;
  final List<OrderItem> items;
  final double totalPrice;
  final String status;
  final String paymentMethod;
  final String deliveryAddress;
  final DateTime estimatedDelivery;
  final DateTime createdAt;
  final String? trackingNumber;

  Order({
    required this.id,
    required this.userId,
    required this.items,
    required this.totalPrice,
    required this.status,
    required this.paymentMethod,
    required this.deliveryAddress,
    required this.estimatedDelivery,
    required this.createdAt,
    this.trackingNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'items': items.map((item) => item.toMap()).toList(),
      'totalPrice': totalPrice,
      'status': status,
      'paymentMethod': paymentMethod,
      'deliveryAddress': deliveryAddress,
      'estimatedDelivery': estimatedDelivery.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'trackingNumber': trackingNumber,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['id'],
      userId: map['userId'],
      items: List<OrderItem>.from(
        map['items'].map((x) => OrderItem.fromMap(x)),
      ),
      totalPrice: map['totalPrice'],
      status: map['status'],
      paymentMethod: map['paymentMethod'],
      deliveryAddress: map['deliveryAddress'],
      estimatedDelivery: DateTime.parse(map['estimatedDelivery']),
      createdAt: DateTime.parse(map['createdAt']),
      trackingNumber: map['trackingNumber'],
    );
  }
}

class OrderItem {
  final String productId;
  final String productName;
  final int quantity;
  final double price;

  OrderItem({
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'productName': productName,
      'quantity': quantity,
      'price': price,
    };
  }

  factory OrderItem.fromMap(Map<String, dynamic> map) {
    return OrderItem(
      productId: map['productId'],
      productName: map['productName'],
      quantity: map['quantity'],
      price: map['price'],
    );
  }
}
