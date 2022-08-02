import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'app_router.dart';

class GeneralHelperMethods {
  static showMessage(String message, {bool vibrate = false}) {
    if (vibrate) HapticFeedback.vibrate();
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.white,
      textColor: Colors.black,
    );
  }

  static showAlertDialog(
    BuildContext context, {
    required String title,
    required String content,
    String? defaultActionTitle,
    CupertinoDialogAction? cupertinoDialogAction,
  }) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(fontWeight: FontWeight.w600, color: Colors.black),
        ),
        content: Text(content, style: Theme.of(context).textTheme.caption),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            onPressed: () {
              AppRouter.goBack(context);
            },
            child: Text(
              defaultActionTitle ?? 'Cancel',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          if (cupertinoDialogAction != null) cupertinoDialogAction
        ],
      ),
    );
  }
}
