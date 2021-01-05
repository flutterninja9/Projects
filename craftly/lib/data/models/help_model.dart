class Help {
  int id;
  String quesText;
  String helpText;
  int user;

  Help({this.id, this.quesText, this.helpText, this.user});

  Help.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quesText = json['quesText'];
    helpText = json['helpText'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quesText'] = this.quesText;
    data['helpText'] = this.helpText;
    data['user'] = this.user;
    return data;
  }
}
