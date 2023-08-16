class ModelCalendarEnum {
  int type;
  String color;

  ModelCalendarEnum({
    required this.type,
    required this.color,
  });

  factory ModelCalendarEnum.fromJson(Map<String, dynamic> json) => ModelCalendarEnum(
    type: json["type"],
    color: json["color"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "color": color,
  };
}
