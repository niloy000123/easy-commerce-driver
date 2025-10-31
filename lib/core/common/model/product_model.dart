class ProductModel {
  int? id;
  String? title;
  String? slug;
  int? variantId;
  String? variantTitle;
  var price;
  String? thumbnailUrl;
  String? thumbnailAltText;
  bool? isWishlisted;

  ProductModel({
    this.id,
    this.title,
    this.slug,
    this.variantId,
    this.variantTitle,
    this.price,
    this.thumbnailUrl,
    this.thumbnailAltText,
    this.isWishlisted,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    variantId = json['variant_id'];
    variantTitle = json['variant_title'];
    price = json['price'];
    thumbnailUrl = json['thumbnail_url'];
    thumbnailAltText = json['thumbnail_alt_text'];
    isWishlisted = json['is_wishlisted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['slug'] = slug;
    data['variant_id'] = variantId;
    data['variant_title'] = variantTitle;
    data['price'] = price;
    data['thumbnail_url'] = thumbnailUrl;
    data['thumbnail_alt_text'] = thumbnailAltText;
    data['is_wishlisted'] = isWishlisted;
    return data;
  }
}
