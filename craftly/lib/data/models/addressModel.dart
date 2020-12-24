class AddressModel {
  int id;
  String toWhomDelivery;
  String contactNo;
  String pincode;
  String locality;
  String address;
  String city;
  String state;
  int user;

  AddressModel(
      {this.id,
      this.toWhomDelivery,
      this.contactNo,
      this.pincode,
      this.locality,
      this.address,
      this.city,
      this.state,
      this.user});

  AddressModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    toWhomDelivery = json['to_whom_delivery'];
    contactNo = json['contact_no'];
    pincode = json['pincode'];
    locality = json['locality'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['to_whom_delivery'] = this.toWhomDelivery;
    data['contact_no'] = this.contactNo;
    data['pincode'] = this.pincode;
    data['locality'] = this.locality;
    data['address'] = this.address;
    data['city'] = this.city;
    data['state'] = this.state;
    data['user'] = this.user;
    return data;
  }
}
