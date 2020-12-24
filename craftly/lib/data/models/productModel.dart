class Product {
  int id;
  String categoryPlain;
  String productName;
  String productDescription;
  double sellingPrice;
  double discountedPrice;
  int stockQty;
  int stockQtyM;
  int stockQtyL;
  int stockQtyXl;
  int stockQtyXxl;
  String createdOn;
  bool active;
  String image1;
  String image2;
  String image3;
  int category;

  Product(
      {this.id,
      this.categoryPlain,
      this.productName,
      this.productDescription,
      this.sellingPrice,
      this.discountedPrice,
      this.stockQty,
      this.stockQtyM,
      this.stockQtyL,
      this.stockQtyXl,
      this.stockQtyXxl,
      this.createdOn,
      this.active,
      this.image1,
      this.image2,
      this.image3,
      this.category});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryPlain = json['categoryPlain'];
    productName = json['productName'];
    productDescription = json['productDescription'];
    sellingPrice = json['sellingPrice'];
    discountedPrice = json['discountedPrice'];
    stockQty = json['stock_qty'];
    stockQtyM = json['stock_qty_m'];
    stockQtyL = json['stock_qty_l'];
    stockQtyXl = json['stock_qty_xl'];
    stockQtyXxl = json['stock_qty_xxl'];
    createdOn = json['created_on'];
    active = json['active'];
    image1 = json['image_1'];
    image2 = json['image_2'];
    image3 = json['image_3'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['categoryPlain'] = this.categoryPlain;
    data['productName'] = this.productName;
    data['productDescription'] = this.productDescription;
    data['sellingPrice'] = this.sellingPrice;
    data['discountedPrice'] = this.discountedPrice;
    data['stock_qty'] = this.stockQty;
    data['stock_qty_m'] = this.stockQtyM;
    data['stock_qty_l'] = this.stockQtyL;
    data['stock_qty_xl'] = this.stockQtyXl;
    data['stock_qty_xxl'] = this.stockQtyXxl;
    data['created_on'] = this.createdOn;
    data['active'] = this.active;
    data['image_1'] = this.image1;
    data['image_2'] = this.image2;
    data['image_3'] = this.image3;
    data['category'] = this.category;
    return data;
  }
}
