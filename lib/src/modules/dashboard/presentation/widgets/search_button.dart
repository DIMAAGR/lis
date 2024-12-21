import 'package:flutter/material.dart';

class SearcherButton extends StatelessWidget {
  const SearcherButton({
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
          color: backgroundColor ?? Colors.amber,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            Icons.business_outlined,
            color: iconColor,
            size: iconSize,
          ),
        ),
      ),
    );
  }
}
