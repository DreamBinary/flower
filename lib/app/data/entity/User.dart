class User {
  User({
    this.id,
    this.phone,
    this.nickname,
    this.avatar,
    this.credit,
    this.rain,
    this.tribeId,
    this.updateTime,
    this.createTime,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phone = json['phone'];
    nickname = json['nickname'];
    avatar = json['avatar'];
    credit = json['credit'];
    rain = json['rain'];
    tribeId = json['tribeId'];
    updateTime = json['updateTime'];
    createTime = json['createTime'];
  }

  int? id;
  String? phone;
  String? nickname;
  String? avatar;
  int? credit;
  int? rain;
  int? tribeId;
  String? updateTime;
  String? createTime;

  @override
  String toString() {
    return 'User{id: $id, phone: $phone, nickname: $nickname, avatar: $avatar, credit: $credit, rain: $rain, tribeId: $tribeId, updateTime: $updateTime, createTime: $createTime}';
  }
}
