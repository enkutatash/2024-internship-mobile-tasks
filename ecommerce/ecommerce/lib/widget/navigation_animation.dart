import 'package:flutter/material.dart';

class NavigationAnimation extends PageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    const begin = Offset(1.0, 0.0); // Slide from the right
    const end = Offset.zero;
    const curve = Curves.easeInOut;

    var tween = Tween<Offset>(begin: begin, end: end);
    var curvedAnimation = CurvedAnimation(
      parent: animation,
      curve: curve,
    );

    var offsetAnimation = tween.animate(curvedAnimation);

    return SlideTransition(
      position: offsetAnimation,
      child: child,
    );
  }
}
