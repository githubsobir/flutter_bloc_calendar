class ModelIntegration {
  int countDayMont;
  String color;
  int type;
  int day;

  ModelIntegration({
    required this.countDayMont,
    required this.color,
    required this.type,
    required this.day,
  });

  factory ModelIntegration.fromJson(Map<String, dynamic> json) =>
      ModelIntegration(
        countDayMont: json["countDayMont"],
        color: json["color"],
        type: json["type"],
        day: json["day"],
      );

  Map<String, dynamic> toJson() => {
        "countDayMont": countDayMont,
        "color": color,
        "type": type,
        "day": day,
      };
}
