class AllDataModel {
  bool? success;
  String? message;
  List<Data>? data;

  AllDataModel({this.success, this.message, this.data});

  AllDataModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  bool? onSale;
  int? salePercent;
  int? sold;
  bool? sliderNew;
  bool? sliderRecent;
  bool? sliderSold;
  String? date;
  String? title;
  Categories? categories;
  Subcate? subcate;
  Shop? shop;
  String? price;
  String? saleTitle;
  String? salePrice;
  String? description;
  String? colors;
  String? size;
  List<Images>? images;
  int? iV;
  bool? inWishlist;

  Data(
      {this.sId,
      this.onSale,
      this.salePercent,
      this.sold,
      this.sliderNew,
      this.sliderRecent,
      this.sliderSold,
      this.date,
      this.title,
      this.categories,
      this.subcate,
      this.shop,
      this.price,
      this.saleTitle,
      this.salePrice,
      this.description,
      this.colors,
      this.size,
      this.images,
      this.iV,
      this.inWishlist});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    onSale = json['on_sale'];
    salePercent = json['sale_percent'];
    sold = json['sold'];
    sliderNew = json['slider_new'];
    sliderRecent = json['slider_recent'];
    sliderSold = json['slider_sold'];
    date = json['date'];
    title = json['title'];
    categories = json['categories'] != null
        ? new Categories.fromJson(json['categories'])
        : null;
    subcate =
        json['subcate'] != null ? new Subcate.fromJson(json['subcate']) : null;
    shop = json['shop'] != null ? new Shop.fromJson(json['shop']) : null;
    price = json['price'];
    saleTitle = json['sale_title'];
    salePrice = json['sale_price'];
    description = json['description'];
    colors = json['colors'];
    size = json['size'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    iV = json['__v'];
    inWishlist = json['in_wishlist'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['on_sale'] = this.onSale;
    data['sale_percent'] = this.salePercent;
    data['sold'] = this.sold;
    data['slider_new'] = this.sliderNew;
    data['slider_recent'] = this.sliderRecent;
    data['slider_sold'] = this.sliderSold;
    data['date'] = this.date;
    data['title'] = this.title;
    if (this.categories != null) {
      data['categories'] = this.categories!.toJson();
    }
    if (this.subcate != null) {
      data['subcate'] = this.subcate!.toJson();
    }
    if (this.shop != null) {
      data['shop'] = this.shop!.toJson();
    }
    data['price'] = this.price;
    data['sale_title'] = this.saleTitle;
    data['sale_price'] = this.salePrice;
    data['description'] = this.description;
    data['colors'] = this.colors;
    data['size'] = this.size;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    data['in_wishlist'] = this.inWishlist;
    return data;
  }
}

class Categories {
  String? sId;
  String? type;
  String? date;
  String? name;
  String? image;
  int? iV;

  Categories({this.sId, this.type, this.date, this.name, this.image, this.iV});

  Categories.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    type = json['type'];
    date = json['date'];
    name = json['name'];
    image = json['image'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['type'] = this.type;
    data['date'] = this.date;
    data['name'] = this.name;
    data['image'] = this.image;
    data['__v'] = this.iV;
    return data;
  }
}

class Subcate {
  String? sId;
  String? date;
  String? name;
  String? parentid;
  int? iV;

  Subcate({this.sId, this.date, this.name, this.parentid, this.iV});

  Subcate.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    date = json['date'];
    name = json['name'];
    parentid = json['parentid'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['date'] = this.date;
    data['name'] = this.name;
    data['parentid'] = this.parentid;
    data['__v'] = this.iV;
    return data;
  }
}

class Shop {
  String? sId;
  bool? isActive;
  String? createdAt;
  String? name;
  String? description;
  String? shopemail;
  String? shopaddress;
  String? shopcity;
  String? userid;
  String? image;
  int? iV;

  Shop(
      {this.sId,
      this.isActive,
      this.createdAt,
      this.name,
      this.description,
      this.shopemail,
      this.shopaddress,
      this.shopcity,
      this.userid,
      this.image,
      this.iV});

  Shop.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    name = json['name'];
    description = json['description'];
    shopemail = json['shopemail'];
    shopaddress = json['shopaddress'];
    shopcity = json['shopcity'];
    userid = json['userid'];
    image = json['image'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['name'] = this.name;
    data['description'] = this.description;
    data['shopemail'] = this.shopemail;
    data['shopaddress'] = this.shopaddress;
    data['shopcity'] = this.shopcity;
    data['userid'] = this.userid;
    data['image'] = this.image;
    data['__v'] = this.iV;
    return data;
  }
}

class Images {
  String? sId;
  String? filename;
  String? url;

  Images({this.sId, this.filename, this.url});

  Images.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    filename = json['filename'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['filename'] = this.filename;
    data['url'] = this.url;
    return data;
  }
}
