import 'package:flutter/material.dart';

class CustomDropdownWidget extends StatelessWidget {
  final String? initialValue;
  final List<DropdownMenuItem<String>> items;
  final ValueChanged<String?>? onChanged;

  // Theme
  final bool? isDark;

  // Colors
  final Color? lightDropdownColor;
  final Color? darkDropdownColor;

  final Color? lightIconColor;
  final Color? darkIconColor;

  final TextStyle? lightStyle;
  final TextStyle? darkStyle;

  // Border
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? errorBorder;

  // Sizes
  final double iconSize;
  final double borderRadius;

  const CustomDropdownWidget({
    super.key,
    required this.items,
    this.initialValue,
    this.onChanged,

    // Theme
    this.isDark,

    // Colors
    this.lightDropdownColor,
    this.darkDropdownColor,
    this.lightIconColor,
    this.darkIconColor,
    this.lightStyle,
    this.darkStyle,

    // Border
    this.border,
    this.focusedBorder,
    this.enabledBorder,
    this.errorBorder,

    // Sizes
    this.iconSize = 30,
    this.borderRadius = 16,
  });

  @override
  Widget build(BuildContext context) {
    final bool dark = isDark == true;

    final Color dropdownColor = dark
        ? darkDropdownColor ?? Colors.black
        : lightDropdownColor ?? Colors.white;

    final Color iconColor = dark
        ? darkIconColor ?? Colors.white
        : lightIconColor ?? Colors.black;

    final TextStyle style = dark
        ? darkStyle ?? const TextStyle(color: Colors.white)
        : lightStyle ?? const TextStyle(color: Colors.black);

    return DropdownButtonFormField<String>(
      iconSize: iconSize,

      iconDisabledColor: iconColor,
      iconEnabledColor: iconColor,

      dropdownColor: dropdownColor,

      style: style,

      borderRadius: BorderRadius.circular(borderRadius),

      initialValue: initialValue,

      decoration: InputDecoration(
        border: border ?? buildOutlineInputBorder(),
        focusedBorder: focusedBorder ?? buildOutlineInputBorder(),
        enabledBorder: enabledBorder ?? buildOutlineInputBorder(),
        errorBorder: errorBorder ?? buildOutlineInputBorder(),
      ),

      items: items,

      onChanged: onChanged,
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: const BorderSide(
        width: 1,
        color: Colors.white,
      ),
    );
  }
}