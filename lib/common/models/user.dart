
class User {
  final int userId;
  final int isVerifired;
  User({
    required this.userId,
    required this.isVerifired,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'isVerifired': isVerifired,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      userId: map['userId'] as int,
      isVerifired: map['isVerifired'] as int,
    );
  }
}
