class User {
  int id;
  String phoneNo;
  String gender;
  String profilePic;
  int user;

  User({this.id, this.phoneNo, this.gender, this.profilePic, this.user});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phoneNo = json['phone_no'];
    gender = json['gender'];
    profilePic = json['profilePic'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['phone_no'] = this.phoneNo;
    data['gender'] = this.gender;
    data['profilePic'] = this.profilePic;
    data['user'] = this.user;
    return data;
  }
}
