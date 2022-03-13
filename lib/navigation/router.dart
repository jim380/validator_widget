import 'package:flutter/material.dart';

import 'package:validator_widget/models/models.dart';
import 'package:validator_widget/models/pages.dart';
import 'package:validator_widget/screens/screens.dart';

class AppRouter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  final AppStateManager appStateManager;

  AppRouter({
    required this.appStateManager,
  }) : navigatorKey = GlobalKey<NavigatorState>() {
    appStateManager.addListener(notifyListeners);
  }

  @override
  void dispose() {
    appStateManager.removeListener(notifyListeners);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _handlePopPage,
      pages: [
        // add pages here

        // the the app is not initialized 
        if (!appStateManager.isInitialized) DashboardScreen.page(),
        if (appStateManager.isInitialized && !appStateManager.isLoggedIn)
          DashboardScreen.page(),
      ],
    );
  }

  bool _handlePopPage(Route<dynamic> route, result) {
    // if the current route's pop failed, return false
    if (!route.didPop(result)) {
      return false;
    }

    // If the user taps the Back button from the Dashboard screen
    // go to the Dashboard screen
    if (route.settings.name == Pages.dashboardPath) {
      appStateManager.goToDashboard();
    }

    // If the user taps the Back button from the peggo screen
    // go to the Dashboard screen
    if (route.settings.name == Pages.peggoPath) {
      appStateManager.goToDashboard();
    }

    // If the user taps the Back button from the node info screen
    // go to the Dashboard screen
    if (route.settings.name == Pages.nodeInfoPath) {
      appStateManager.goToDashboard();
    }
  
    return true;
  }

  @override
  Future<void> setNewRoutePath(configuration) async => null;
}