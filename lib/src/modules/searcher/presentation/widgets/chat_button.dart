import 'package:flutter/material.dart';

class ChatButton extends StatelessWidget {
  const ChatButton({
    required this.onTap,
    this.buttonSize = 56,
    this.iconSize = 28,
    this.iconColor,
    this.backgroundColor,
    super.key,
  });

  final VoidCallback onTap;
  final Color? iconColor;
  final Color? backgroundColor;
  final double buttonSize;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(60),
      onTap: onTap,
      child: Container(
        height: buttonSize,
        width: buttonSize,
        decoration: BoxDecoration(
          color: backgroundColor ?? const Color(0x803BA61A),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            Icons.chat,
            color: iconColor,
            size: iconSize,
          ),
        ),
      ),
    );
  }
}
