class Athlete {
  String? name;
  String? level;

  Athlete({required this.name, required this.level});

  Athlete.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['level'] = level;
    return data;
  }
}
