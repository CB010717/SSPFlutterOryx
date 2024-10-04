class Offer {
  final String name;
  final String slug;
  final String image;
  final String title;
  final String type;
  final String discount;
  final DateTime expireDate;

  Offer({
    required this.name,
    required this.slug,
    required this.image,
    required this.title,
    required this.type,
    required this.discount,
    required this.expireDate,
  });

  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
      name: json['name'],
      slug: json['slug'],
      image: json['image'],
      title: json['title'],
      type: json['type'],
      discount: json['discount'],
      expireDate: DateTime.parse(json['expire_date']),
    );
  }
}
