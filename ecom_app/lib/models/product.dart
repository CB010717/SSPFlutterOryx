class Product {
  final int id;
  final String name;
  final double price;
  final String image;
  final String description;
  final String category;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.description,
    required this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(), // Ensure price is a double
      image: json['image'], // Add image property
      description: json['description'], // Corrected spelling from 'descripton'
      category: json['category'], // Add category property
    );
  }

  // Optional: You can add a toJson method if you need to convert the object back to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'image': image,
      'description': description,
      'category': category,
    };
  }
}
