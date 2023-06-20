import 'package:flower/app/data/entity/User.dart';

class TribeInfo {
  TribeInfo({
    this.name = "",
    this.description = "",
    this.members = const [],
  });

  TribeInfo.fromJson(dynamic json) {
    name = json['name'];
    description = json['description'];
    if (json['members'] != null) {
      members = [];
      json['members'].forEach((v) {
        members.add(User.fromJson(v));
      });
    }
  }

  String name = "";
  String description = "";
  List<User> members = [];

  @override
  String toString() {
    return 'TribeInfo{name: $name, description: $description, members: $members}';
  }
}
