class UserFlower {
  UserFlower({
    required this.id,
    required this.name,
    required this.growTime,
    required this.pic,
    required this.createTime,
    required this.updateTime,
    required this.isPlanted,
    required this.waterFast,
  });

  UserFlower.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    growTime = json['growTime'];
    pic = json['pic'];
    createTime = json['createTime'];
    updateTime = json['updateTime'];
    isPlanted = json['isPlanted'];
    waterFast = json['waterFast'];
  }

  late int id;
  late String name;
  late double growTime;
  late String pic;
  late String createTime;
  late String updateTime;
  late int isPlanted;
  late int waterFast;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['growTime'] = growTime;
    map['pic'] = pic;
    map['createTime'] = createTime;
    map['updateTime'] = updateTime;
    map['isPlanted'] = isPlanted;
    map['waterFast'] = waterFast;
    return map;
  }

  @override
  String toString() {
    return 'Flower{id: $id, name: $name, growTime: $growTime, pic: $pic, createTime: $createTime, updateTime: $updateTime, isPlanted: $isPlanted, waterFast: $waterFast}';
  }
}
