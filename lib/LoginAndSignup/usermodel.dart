class UserModel {
  String id;
  String displayName;
  String email;
  String? photoURL;
  String? createdAt;

  UserModel({
    required this.id,
    required this.displayName,
    required this.email,
    required this.photoURL,
    required this.createdAt,
  });
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'displayName': displayName,
      'email': email,
      'photoURL': photoURL,
      'createdAt': createdAt,
    };
  }
}
