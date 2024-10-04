class Settings {
  final String name;
  final String logo;
  final String banner;
  final String email;
  final String phone;
  final String slogan;
  final String address;
  final String facebook;
  final String youtube;
  final String instagram;
  final String twitter;

  Settings({
    required this.name,
    required this.logo,
    required this.banner,
    required this.email,
    required this.phone,
    required this.slogan,
    required this.address,
    required this.facebook,
    required this.youtube,
    required this.instagram,
    required this.twitter,
  });

  // factory Settings.fromJson(Map<String, dynamic> json) {
  //   return Settings(
  //     name: json['name'],
  //     logo: json['logo'],
  //     banner: json['banner'],
  //     email: json['email'],
  //     phone: json['phone'],
  //     slogan: json['slogan'],
  //     address: json['address'],
  //     facebook: json['facebook'],
  //     youtube: json['youtube'],
  //     instagram: json['instagram'],
  //     twitter: json['twitter'],
  //   );
  // }
}
