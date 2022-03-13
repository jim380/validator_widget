import 'dart:async';
import 'package:flutter/material.dart';

class SideMenuTabs {
  static const int dashboard = 0;
  static const int peggo = 1;
  static const int nodeInfo = 2;
}

class AppStateManager extends ChangeNotifier {
  // if the app is initialized
  bool _initialized = false;
  // if the user has logged in
  bool _loggedIn = false;

  int _selectedTab = SideMenuTabs.dashboard;

  // getter methods
  bool get isInitialized => _initialized;
  bool get isLoggedIn => _loggedIn;
  int get getSelectedTab => _selectedTab;

  void initializeApp() {
    // a 2s delay until the app screen is displayed
    Timer(const Duration(milliseconds: 2000), () {
      _initialized = true;
      notifyListeners(); // notify all listener
    },);
  }
  
  // mock login
  void login(String username, String password) {
    _loggedIn = true;
    notifyListeners();
  }

  void goToTab(index) {
    _selectedTab = index;
    notifyListeners();
  }
  
  void goToDashboard() {
    _selectedTab = SideMenuTabs.dashboard;
    notifyListeners();
  }

  void goToPeggo() {
    _selectedTab = SideMenuTabs.peggo;
    notifyListeners();
  }

  void goToNodeInfo() {
    _selectedTab = SideMenuTabs.nodeInfo;
    notifyListeners();
  }
  
  void logout() {
    _loggedIn = false;
    _initialized = false;
    _selectedTab = 0;
    initializeApp();
    notifyListeners();
  }
}