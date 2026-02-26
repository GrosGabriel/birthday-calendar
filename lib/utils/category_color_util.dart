import 'package:flutter/material.dart';

class CategoryColorUtil {
  static Map<String, Color> getCategoryColor(String category) {
    switch (category) {
      case 'Family':
        return {'color': Colors.blue, 'light': Colors.blue.shade100};
      case 'Friends':
        return {'color': Colors.green, 'light': Colors.green.shade100};
      case 'Work':
        return {'color': Colors.orange, 'light': Colors.orange.shade100};
      default:
        return {'color': Colors.grey, 'light': Colors.grey.shade100};
    }
  }
}
