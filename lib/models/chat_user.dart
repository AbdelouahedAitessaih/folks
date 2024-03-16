class ChatUser {
  final String uid;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String imageUrl;
  late DateTime lastActive;

  ChatUser(
      {required this.uid,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.password,
      required this.imageUrl,
      required this.lastActive});

  factory ChatUser.fromJson(Map<String, dynamic> _json) {
    return ChatUser(
        uid: _json['uid'],
        firstName: _json['firstName'],
        lastName: _json['lastName'],
        email: _json['email'],
        password: _json['password'],
        imageUrl: _json['imageUrl'],
        lastActive: _json['lastActive'].toDate());
  }

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'imageUrl': imageUrl,
      'lastActive': lastActive
    };
  }

  String lastDayActive() {
    return "${lastActive.day}/${lastActive.month}/${lastActive.year}";
  }

  bool wasRecentlyActive() {
    return DateTime.now().difference(lastActive).inHours < 2;
  }
}
