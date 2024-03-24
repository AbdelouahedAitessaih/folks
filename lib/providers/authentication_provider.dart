import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:folks/models/chat_user.dart';
import 'package:folks/services/database_service.dart';
import 'package:folks/services/navigation_service.dart';
import 'package:get_it/get_it.dart';

class AutheticationProvider extends ChangeNotifier {
  FirebaseAuth _auth;
  NavigationService _navigationService;
  DatabaseService _databaseService;

  ChatUser user;

  AutheticationProvider() {
    _auth = FirebaseAuth.instance;
    _navigationService = GetIt.instance.get<NavigationService>();
    _databaseService = GetIt.instance.get<DatabaseService>();

    _auth.signOut();
    //Control Authentication State
    _auth.authStateChanges().listen((_user) {
      if (_user != null) {
        _databaseService.updateUser(_user.uid, {'last_active': DateTime.now()});
        _databaseService.getUser(_user.uid).then((_snapshot) {
          Map<String, dynamic> _userData = _snapshot.data();
          user = ChatUser.fromJson({
            'uid': _user.uid,
            'first_name': _userData['first_name'],
            'last_name': _userData['last_name'],
            'email': _userData['email'],
            'image_url': _userData['image_url'],
            'last_active': _userData['last_active']
          });
          _navigationService.removeAndNavigateToRoute('/home');
        });
      } else {
        _navigationService.removeAndNavigateToRoute('/login');
      }
    });
  }

  Future<void> login(String _email, String _password) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: _email, password: _password);
      print(_auth.currentUser);
    } on FirebaseAuthException {
      print("Error logging user into firebase");
    } catch (e) {
      print(e);
    }
  }
}
