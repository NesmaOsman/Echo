import 'dart:io'; // For File class
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String _email = "";
  String _username = "";
  String _password = "";
  String _phone = "";
  File? _image;

  // Getters
  String get email => _email;
  String get username => _username;
  String get password => _password;
  String get phone => _phone;
  File? get image => _image;

  // Setters
  void setUserData({
    required String email,
    required String username,
    required String password,
    required String phone,
    File? image,
  }) {
    _email = email;
    _username = username;
    _password = password;
    _phone = phone;
    _image = image;
    notifyListeners(); // Notify listeners to update the UI
  }

  // Method to update username
  void setUsername(String newUsername) {
    _username = newUsername;
    notifyListeners(); // Notify listeners to update the UI
  }

  // Method to update email
  void setEmail(String newEmail) {
    _email = newEmail;
    notifyListeners(); // Notify listeners to update the UI
  }

  // Method to update password
  void setPassword(String newPassword) {
    _password = newPassword;
    notifyListeners(); // Notify listeners to update the UI
  }

  // Method to update phone
  void setPhone(String newPhone) {
    _phone = newPhone;
    notifyListeners(); // Notify listeners to update the UI
  }

  // Method to update profile image
  void setImage(File newImage) {
    _image = newImage;
    notifyListeners(); // Notify listeners to update the UI
  }

  // Method to clear user data (logout)
  void clearUserData() {
    _email = "";
    _username = "";
    _password = "";
    _phone = "";
    _image = null;
    notifyListeners(); // Notify listeners to update the UI
  }
}