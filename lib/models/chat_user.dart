class ChatUser {
  final String uid;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String imageUrl;
  final DateTime lastActive;

  ChatUser(
      {this.uid,
      this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.imageUrl,
      this.lastActive});

  factory ChatUser.fromJson(Map<String, dynamic> _json) {
    return ChatUser(
        uid: _json['uid'],
        firstName: _json['first_name'],
        lastName: _json['last_name'],
        email: _json['email'],
        // password: _json['password'],
        imageUrl: _json['image_url'],
        lastActive: _json['last_active'].toDate());
  }

  Map<String, dynamic> toMap() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'image_url': imageUrl,
      'last_active': lastActive
    };
  }

  String lastDayActive() {
    return "${lastActive.day}/${lastActive.month}/${lastActive.year}";
  }

  bool wasRecentlyActive() {
    return DateTime.now().difference(lastActive).inHours < 2;
  }
}
