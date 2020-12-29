class Promo {
  int id;
  String promoText;
  String image;

  Promo({this.id, this.promoText, this.image});

  Promo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    promoText = json['promoText'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['promoText'] = this.promoText;
    data['image'] = this.image;
    return data;
  }
}
