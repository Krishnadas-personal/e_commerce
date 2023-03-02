class ProductDetails {
  ProductDetails({
    this.id,
    this.companyId,
    this.productId,
    this.categoryId,
    this.subcatId,
    this.price,
    this.sellingPrice,
    this.qty,
    this.status,
    this.company,
    this.proName,
    this.image,
    this.thumb,
    this.thumbStatus,
    this.attribute,
    this.orderBy,
    this.createdDate,
    this.createdTime,
    this.updatedDate,
    this.updatedTime,
    this.attributeId,
    this.attributeValue,
    this.attributeValueInGram,
    this.category,
    this.inCart,
    this.cartQty,
  });

  final String? id;
  final String? companyId;
  final String? productId;
  final String? categoryId;
  final String? subcatId;
  final String? price;
  final String? sellingPrice;
  final String? qty;
  final String? status;
  final String? company;
  final String? proName;
  final String? image;
  final String? thumb;
  final String? thumbStatus;
  final dynamic attribute;
  final String? orderBy;
  final DateTime? createdDate;
  final String? createdTime;
  final DateTime? updatedDate;
  final String? updatedTime;
  final dynamic attributeId;
  final dynamic attributeValue;
  final String? attributeValueInGram;
  final String? category;
  final String? inCart;
  final String? cartQty;

  factory ProductDetails.fromJson(Map<String, dynamic> json) => ProductDetails(
        id: json["id"],
        companyId: json["company_id"],
        productId: json["product_id"],
        categoryId: json["category_id"],
        subcatId: json["subcat_id"],
        price: json["price"],
        sellingPrice: json["selling_price"],
        qty: json["qty"],
        status: json["status"],
        company: json["company"],
        proName: json["pro_name"],
        image: json["image"],
        thumb: json["thumb"],
        thumbStatus: json["thumb_status"],
        attribute: json["attribute"],
        orderBy: json["order_by"],
        createdDate: json["created_date"] == null
            ? null
            : DateTime.parse(json["created_date"]),
        createdTime: json["created_time"],
        updatedDate: json["updated_date"] == null
            ? null
            : DateTime.parse(json["updated_date"]),
        updatedTime: json["updated_time"],
        attributeId: json["attribute_id"],
        attributeValue: json["attribute_value"],
        attributeValueInGram: json["attribute_value_in_gram"],
        category: json["category"],
        inCart: json["in_cart"],
        cartQty: json["cart_qty"],
      );
}
