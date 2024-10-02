class User {
  final int id;            // Unique identifier for the user
  final String email;     // User's email address

  User({
    required this.id,
    required this.email,
  });

  // Factory method to create a User instance from a JSON map
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],           // Extracting 'id' from the JSON
      email: json['email'],     // Extracting 'email' from the JSON
    );
  }

  // Optional: Method to convert User to JSON for saving
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
    };
  }
}
