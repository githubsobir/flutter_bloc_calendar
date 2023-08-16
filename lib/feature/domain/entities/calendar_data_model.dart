class ModelDayCalendarData {
  String month;
  int year;
  List<Day> days;

  ModelDayCalendarData({
    required this.month,
    required this.year,
    required this.days,
  });

  factory ModelDayCalendarData.fromJson(Map<String, dynamic> json) => ModelDayCalendarData(
    month: json["month"],
    year: json["year"],
    days: List<Day>.from(json["days"].map((x) => Day.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "month": month,
    "year": year,
    "days": List<dynamic>.from(days.map((x) => x.toJson())),
  };
}

class Day {
  int day;
  int type;

  Day({
    required this.day,
    required this.type,
  });

  factory Day.fromJson(Map<String, dynamic> json) => Day(
    day: json["day"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "day": day,
    "type": type,
  };
}
