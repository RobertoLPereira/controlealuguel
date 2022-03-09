class Geramvcflutter {
  String geraMvcFlutter;

  Geramvcflutter({this.geraMvcFlutter});

  Geramvcflutter.fromJson(Map<String, dynamic> json) {
    geraMvcFlutter = json['gera_mvc_flutter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gera_mvc_flutter'] = this.geraMvcFlutter;
    return data;
  }
}
