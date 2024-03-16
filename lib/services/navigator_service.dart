
import 'package:flutter/material.dart';

typedef RoutePredicate = bool Function(Route<dynamic> route);

class NavigatorService 
{

  bool isNotificationInitialized = false;

  /// `navigatorKey` is navigator for whole app.
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  /// This function is used to open new screen.
  ///
  /// [routeName] - `routeName` related to page which you want to open.
  ///
  /// [argument] - passing data `routeName`.
  Future<dynamic> navigateTo(
      {required String routName, dynamic arguments}) async {
    return navigatorKey.currentState!.pushNamed(routName, arguments: arguments);
  }

  /// This function is used to replace new screen.
  ///
  /// [materialPageRoute] - a screen to replace with current screen.
  ///
  Future<dynamic> pushReplacement(
      {required Widget widget}) async {
    return navigatorKey.currentState!.pushReplacement(MaterialPageRoute(builder: (context)=>widget));
  }

  /// This function is used to replace new screen.
  ///
  /// [routeName] - `routeName` related to page which to replace instead of current one.
  ///
  /// [argument] - passing data `routeName`.
  Future<dynamic> navigateReplacementTo(
      {required String routName, dynamic arguments}) async {
    return navigatorKey.currentState!
        .pushReplacementNamed(routName, arguments: arguments);
  }

  /// This function is used to open new screen.
  ///
  /// [materialPageRoute] - a screen to replace with current screen.
  ///
  Future<dynamic> navigatePush({required Widget widget}) {
    return navigatorKey.currentState!.push(MaterialPageRoute(builder: (context)=>widget));
   /*  return navigatorKey.currentState!.push(
      PageRouteBuilder(
        transitionsBuilder: (context, animation, secondaryAnimation, child) => child,
        pageBuilder: (context,animation,secondaryAnimation)=>widget)
      ); */

      /* return navigatorKey.currentState!.push(PageTransition(
        type: PageTransitionType.rightToLeft,
        child: widget
      )); */
  }

  /// This function is used to replace current route by pushing `materialPageRoute`.
  ///
  /// [materialPageRoute] - a route to push
  ///
  /// [callBack] - a function to execute on popup of `materialPageRoute`.
  Future<dynamic> navigatePushReplacementMaterialPageRoute(
      {required Widget widget, dynamic callBack}) async {
    return navigatorKey.currentState!
        .pushReplacement(MaterialPageRoute(builder: (context)=>widget))
        .then((value) {
      callBack(value);
    });
  }

  /// This function is used to push new route in navigator, and then remove all the previous routes until the `predicate` returns true.
  Future<T?> pushAndRemoveUntil<T extends Object?>(
      {required Route<T> newRoute, required RoutePredicate predict}) {
    return navigatorKey.currentState!.pushAndRemoveUntil(newRoute, predict);
  }

  /// This function is used to `context` of application.
  BuildContext getContext() {
    return navigatorKey.currentState!.context;
  }

  /// This function is used to pop-up the screen or dialog box.
  ///
  /// [result] - passed data to previous screen.
  ///
  Future<dynamic> goBack({dynamic result}) async {
    return navigatorKey.currentState?.pop(result);
  }

  /// This function is used to call `pop` repeatedly untile `predit` return `true`.
  Future<dynamic> popUntil({required RoutePredicate predict}) async {
    //return navigatorKey.currentState!.popUntil(predict);
    return navigatorKey.currentState!.popUntil(predict);
  }
}