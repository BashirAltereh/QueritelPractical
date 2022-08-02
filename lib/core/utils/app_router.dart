import 'package:flutter/cupertino.dart';

class AppRouter {
  static Future goToNextScreen(BuildContext context, Widget widget,
      {bool isReplacement = false}) async {
    if (isReplacement) {
      await Navigator.of(context).pushReplacement(
          CupertinoPageRoute<Map>(builder: (BuildContext context) {
        return widget;
      }));
    } else {
      await Navigator.of(context)
          .push(CupertinoPageRoute<Map>(builder: (BuildContext context) {
        return widget;
      }));
    }
  }

  static Future goToNextScreenAndRemove(
      BuildContext context, Widget widget) async {
    await Navigator.of(context).pushAndRemoveUntil(
        CupertinoPageRoute(builder: (context) => widget),
        (Route<dynamic> route) => false);
  }

  static Future goBack(BuildContext context, {Function? onCantPop}) async {
    if (_canPop(context)) {
      Navigator.pop(context);
    } else {
      debugPrint('there is nothing behind this page');
      if (onCantPop != null) {
        onCantPop();
      }
    }
  }

  static bool _canPop(BuildContext context) {
    return Navigator.canPop(context);
  }
}
