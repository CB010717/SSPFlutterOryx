class Product {
  final int id;
  final String name;
  final String slug;
  final String sku;
  final String description;
  final int stockStatus;
  final int qtyInStock;
  final double salePrice;
  final double originalPrice;
  final String image;
  final String gallery;
  final String specification;

  Product({
    required this.id,
    required this.name,
    required this.slug,
    required this.sku,
    required this.description,
    required this.stockStatus,
    required this.qtyInStock,
    required this.salePrice,
    required this.originalPrice,
    required this.image,
    required this.gallery,
    required this.specification,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      sku: json['sku'],
      description: json['description'],
      stockStatus: json['stock_status'],
      qtyInStock: json['qty_in_stock'],
      salePrice: (json['sale_price'] as num).toDouble(),
      originalPrice: (json['original_price'] as num).toDouble(),
      image: json['image'],
      gallery: json['gallery'],
      specification: json['specification'],
    );
  }
}
