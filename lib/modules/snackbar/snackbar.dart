import 'package:chatify/modules/snackbar/snackbar_type.dart';
import 'package:flutter/material.dart';

class Snackbar {
  Snackbar(SnackbarType success);

  static SnackBar build(SnackbarType type, String? title, String message,
      {int duration = 3}) {
    return _build(type, title, message);
  }

  static SnackBar _build(SnackbarType type, String? title, String message,
      {int duration = 3}) {
    final textPainter = TextPainter(
      text: TextSpan(
          text: message,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
          )),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();

    return SnackBar(
      content: _messageWidget(message),
      duration: Duration(seconds: duration),
      backgroundColor: const Color(0xFF5D5D5D).withOpacity(0.95),
    );
  }

  static Widget _messageWidget(String message) {
    return Text(
      message,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  static String _getIcon(SnackbarType type) {
    return "";
  }
}
