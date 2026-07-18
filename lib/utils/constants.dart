class Constants {
  // App Info
  static const String appName = 'CAPRICHO VAGARY';
  static const String appVersion = '1.0.0';
  static const String packageName = 'com.caprichovagary.app';

  // Service Types
  static const List<String> serviceTypes = [
    'Haircut',
    'Hair Treatment',
    'Beard Trim',
    'Full Grooming',
    'Kids Cut',
    'Color Service',
  ];

  // Product Categories
  static const List<String> productCategories = [
    'Clothing',
    'Grooming Products',
    'Accessories',
    'Electronics',
    'Home & Lifestyle',
  ];

  // Booking Status
  static const String bookingPending = 'pending';
  static const String bookingConfirmed = 'confirmed';
  static const String bookingInProgress = 'in_progress';
  static const String bookingCompleted = 'completed';
  static const String bookingCancelled = 'cancelled';

  // Order Status
  static const String orderPending = 'pending';
  static const String orderProcessing = 'processing';
  static const String orderShipped = 'shipped';
  static const String orderDelivered = 'delivered';
  static const String orderCancelled = 'cancelled';

  // Time Slots
  static const List<String> timeSlots = [
    '08:00 AM',
    '09:00 AM',
    '10:00 AM',
    '11:00 AM',
    '12:00 PM',
    '01:00 PM',
    '02:00 PM',
    '03:00 PM',
    '04:00 PM',
    '05:00 PM',
    '06:00 PM',
    '07:00 PM',
  ];

  // Pricing
  static const double haircut = 15.0;
  static const double beardTrim = 10.0;
  static const double fullGrooming = 35.0;
  static const double colorService = 50.0;
}
