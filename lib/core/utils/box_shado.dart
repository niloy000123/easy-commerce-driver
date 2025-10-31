import 'package:flutter/material.dart';
import 'package:simple_ecommerce_delivery_app/core/theme/theme.dart';

List<BoxShadow> boxShadow(BuildContext context) {
  return [
    BoxShadow(
      color: colors(context).hintTextColor!.withOpacity(0.2), // Shadow color
      spreadRadius: 1, // Spread radius
      blurRadius: 10, // Blur radius
      offset: const Offset(
        0,
        3,
      ), // Offset in x and y directions (0, 3) means the shadow will be below the container, use Offset(0, 0) for shadow on all sides
    ),
  ];
}
