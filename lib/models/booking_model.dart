class BookingModel {
  final String id;
  final String courtName;
  final String timeSlot;
  final int price;
  final String userName;
  final String phone;
  final DateTime startDate;
  final DateTime endDate;
  final DateTime createdAt;

  BookingModel({
    required this.id,
    required this.courtName,
    required this.timeSlot,
    required this.price,
    required this.userName,
    required this.phone,
    required this.startDate,
    required this.endDate,
    required this.createdAt,
  });
  BookingModel copyWith({
    String? courtName,
    String? timeSlot,
    int? price,
    String? userName,
    String? phone,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return BookingModel(
      id: id,
      courtName: courtName ?? this.courtName,
      timeSlot: timeSlot ?? this.timeSlot,
      price: price ?? this.price,
      userName: userName ?? this.userName,
      phone: phone ?? this.phone,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      createdAt: createdAt,
    );
  }
}
