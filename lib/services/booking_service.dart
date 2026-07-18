import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/booking_model.dart';

class BookingService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  static const String collectionName = 'bookings';

  Future<void> createBooking(Booking booking) async {
    try {
      await _db
          .collection(collectionName)
          .doc(booking.id)
          .set(booking.toMap());
    } catch (e) {
      throw Exception('Failed to create booking: $e');
    }
  }

  Future<List<Booking>> getUserBookings(String userId) async {
    try {
      final snapshot = await _db
          .collection(collectionName)
          .where('userId', isEqualTo: userId)
          .orderBy('bookingDate', descending: true)
          .get();

      return snapshot.docs
          .map((doc) => Booking.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch bookings: $e');
    }
  }

  Future<void> updateBookingStatus(String bookingId, String status) async {
    try {
      await _db
          .collection(collectionName)
          .doc(bookingId)
          .update({'status': status});
    } catch (e) {
      throw Exception('Failed to update booking: $e');
    }
  }

  Future<void> cancelBooking(String bookingId) async {
    try {
      await _db.collection(collectionName).doc(bookingId).delete();
    } catch (e) {
      throw Exception('Failed to cancel booking: $e');
    }
  }
}
