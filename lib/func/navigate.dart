import 'dart:io';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Navigate {
  static back(BuildContext context) {
    return Navigator.pop(context);
  }

  static forward({
    @required Widget screen,
    @required BuildContext context,
    PageTransitionType type,
    Duration duration = const Duration(milliseconds: 500),
    bool removeprevious = false,
  }) {
    if (!removeprevious) {
      return Navigator.push(
        context,
        Platform.isIOS == true && type == null
            ? MaterialPageRoute(builder: (_) => screen)
            : PageTransition(
                duration: duration,
                reverseDuration: duration,
                child: screen,
                type: type ?? PageTransitionType.fade,
              ),
      );
    } else {
      return Navigator.pushAndRemoveUntil(
          context,
          Platform.isIOS == true && type == null
              ? MaterialPageRoute(builder: (_) => screen)
              : PageTransition(
                  duration: duration,
                  reverseDuration: duration,
                  child: screen,
                  type: type ?? PageTransitionType.fade,
                ),
          (route) => false);
    }
  }
}
