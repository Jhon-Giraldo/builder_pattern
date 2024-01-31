import 'package:flutter/material.dart';

class ButtonModel {
  final String text;
  final String type;
  final VoidCallback onTap;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool isEnabled;
  final bool isHug;
  final double? width;

  const ButtonModel({
    required this.text,
    required this.type,
    required this.onTap,
    this.prefixIcon,
    this.suffixIcon,
    this.isEnabled = true,
    this.isHug = false,
    this.width,
  });
}
