import 'package:flutter/material.dart';
import 'package:gword/app/core/resources/color_manager.dart';

class NotificationWidget extends StatelessWidget {
  final String message;
  final bool success;

  const NotificationWidget({Key? key, required this.message, required this.success}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: success ? ColorManager.green : ColorManager.red,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(message),
    );
  }
}
