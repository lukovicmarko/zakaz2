class OpeningHours {
  // final String id;
  final String startTime;
  final String endTime;

  OpeningHours({
    // required this.id,
    required this.startTime,
    required this.endTime,
  });
  Map<String, dynamic> toJson() {
    return {
      // "id": id,
      "startTime": startTime,
      "endTime": endTime,
    };
  }
}
