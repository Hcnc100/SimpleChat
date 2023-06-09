

import 'package:flutter/material.dart';

extension ShowSnack on BuildContext {
  void showSnack(String message) {
    ScaffoldMessenger.of(this).clearSnackBars();
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message)
      ),
    );
  }
}