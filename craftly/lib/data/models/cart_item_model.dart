class CartModel {
  List<Data> data;
  List<Items> items;
  String totalPrice;

  CartModel({this.data, this.items, this.totalPrice});

  CartModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    if (json['items'] != null) {
      items = new List<Items>();
      json['items'].forEach((v) {
        items.add(new Items.fromJson(v));
      });
    }
    totalPrice = json['total_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    data['total_price'] = this.totalPrice;
    return data;
  }
}

class Data {
  int id;
  String refId;
  String startDate;
  double totalFinalPrice;
  String orderedDate;
  String deliveredDate;
  bool ordered;
  bool refundDemanded;
  bool refundAccepted;
  bool refunded;
  String refundDemandDate;
  String refundAcceptDate;
  String refundDate;
  String orderStatus;
  String shippingAddress;
  String toWhomDelivery;
  String contactNo;
  String pincode;
  String locality;
  String city;
  String state;
  int user;
  List<int> items;

  Data(
      {this.id,
      this.refId,
      this.startDate,
      this.totalFinalPrice,
      this.orderedDate,
      this.deliveredDate,
      this.ordered,
      this.refundDemanded,
      this.refundAccepted,
      this.refunded,
      this.refundDemandDate,
      this.refundAcceptDate,
      this.refundDate,
      this.orderStatus,
      this.shippingAddress,
      this.toWhomDelivery,
      this.contactNo,
      this.pincode,
      this.locality,
      this.city,
      this.state,
      this.user,
      this.items});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    refId = json['ref_id'];
    startDate = json['start_date'];
    totalFinalPrice = json['total_final_price'];
    orderedDate = json['ordered_date'];
    deliveredDate = json['delivered_date'];
    ordered = json['ordered'];
    refundDemanded = json['refund_demanded'];
    refundAccepted = json['refund_accepted'];
    refunded = json['refunded'];
    refundDemandDate = json['refund_demand_date'];
    refundAcceptDate = json['refund_accept_date'];
    refundDate = json['refund_date'];
    orderStatus = json['order_status'];
    shippingAddress = json['shipping_address'];
    toWhomDelivery = json['to_whom_delivery'];
    contactNo = json['contact_no'];
    pincode = json['pincode'];
    locality = json['locality'];
    city = json['city'];
    state = json['state'];
    user = json['user'];
    items = json['items'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ref_id'] = this.refId;
    data['start_date'] = this.startDate;
    data['total_final_price'] = this.totalFinalPrice;
    data['ordered_date'] = this.orderedDate;
    data['delivered_date'] = this.deliveredDate;
    data['ordered'] = this.ordered;
    data['refund_demanded'] = this.refundDemanded;
    data['refund_accepted'] = this.refundAccepted;
    data['refunded'] = this.refunded;
    data['refund_demand_date'] = this.refundDemandDate;
    data['refund_accept_date'] = this.refundAcceptDate;
    data['refund_date'] = this.refundDate;
    data['order_status'] = this.orderStatus;
    data['shipping_address'] = this.shippingAddress;
    data['to_whom_delivery'] = this.toWhomDelivery;
    data['contact_no'] = this.contactNo;
    data['pincode'] = this.pincode;
    data['locality'] = this.locality;
    data['city'] = this.city;
    data['state'] = this.state;
    data['user'] = this.user;
    data['items'] = this.items;
    return data;
  }
}

class Items {
  int id;
  bool ordered;
  int pID;
  int ordId;
  String orderedOn;
  int quantity;
  String refId;
  String ordStatus;
  String size;
  bool initCheck;
  int user;
  int item;

  Items(
      {this.id,
      this.ordered,
      this.pID,
      this.ordId,
      this.orderedOn,
      this.quantity,
      this.refId,
      this.ordStatus,
      this.size,
      this.initCheck,
      this.user,
      this.item});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ordered = json['ordered'];
    pID = json['pID'];
    ordId = json['ord_id'];
    orderedOn = json['ordered_on'];
    quantity = json['quantity'];
    refId = json['ref_id'];
    ordStatus = json['ord_status'];
    size = json['size'];
    initCheck = json['initCheck'];
    user = json['user'];
    item = json['item'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ordered'] = this.ordered;
    data['pID'] = this.pID;
    data['ord_id'] = this.ordId;
    data['ordered_on'] = this.orderedOn;
    data['quantity'] = this.quantity;
    data['ref_id'] = this.refId;
    data['ord_status'] = this.ordStatus;
    data['size'] = this.size;
    data['initCheck'] = this.initCheck;
    data['user'] = this.user;
    data['item'] = this.item;
    return data;
  }
}
