import 'package:flutter/material.dart';
import '../models/booking.dart';
import '../core/api.dart';

class BookingProvider with ChangeNotifier {
  bool isLoading = false;

  Future<void> createBooking(Booking booking) async {
    isLoading = true;
    notifyListeners();

    try {
      await Api.post('bookings', booking.toJson());
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
