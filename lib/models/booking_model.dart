class Booking {
  final String id;
  final String userId;
  final String serviceType;
  final DateTime bookingDate;
  final String timeSlot;
  final String status;
  final String? notes;
  final double price;
  final DateTime createdAt;

  Booking({
    required this.id,
    required this.userId,
    required this.serviceType,
    required this.bookingDate,
    required this.timeSlot,
    required this.status,
    this.notes,
    required this.price,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'serviceType': serviceType,
      'bookingDate': bookingDate.toIso8601String(),
      'timeSlot': timeSlot,
      'status': status,
      'notes': notes,
      'price': price,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory Booking.fromMap(Map<String, dynamic> map) {
    return Booking(
      id: map['id'],
      userId: map['userId'],
      serviceType: map['serviceType'],
      bookingDate: DateTime.parse(map['bookingDate']),
      timeSlot: map['timeSlot'],
      status: map['status'],
      notes: map['notes'],
      price: map['price'],
      createdAt: DateTime.parse(map['createdAt']),
    );
  }
}
