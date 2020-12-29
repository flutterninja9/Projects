class User {
  List<AccountDetails> accountDetails;
  String email;
  String fname;
  String lname;
  String username;

  User(
      {this.accountDetails, this.email, this.fname, this.lname, this.username});

  User.fromJson(Map<String, dynamic> json) {
    if (json['account_details'] != null) {
      accountDetails = new List<AccountDetails>();
      json['account_details'].forEach((v) {
        accountDetails.add(new AccountDetails.fromJson(v));
      });
    }
    email = json['email'];
    fname = json['fname'];
    lname = json['lname'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.accountDetails != null) {
      data['account_details'] =
          this.accountDetails.map((v) => v.toJson()).toList();
    }
    data['email'] = this.email;
    data['fname'] = this.fname;
    data['lname'] = this.lname;
    data['username'] = this.username;
    return data;
  }
}

class AccountDetails {
  int id;
  String phoneNo;
  String gender;
  String profilePic;
  int user;

  AccountDetails(
      {this.id, this.phoneNo, this.gender, this.profilePic, this.user});

  AccountDetails.fromJson(Map<String, dynamic> json) {
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
