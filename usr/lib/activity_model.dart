import 'package:flutter/material.dart';

class ActivityStat {
  final String name;
  final int pending;
  final int today;
  final int yesterday;
  final IconData icon;
  final Color color;

  ActivityStat({
    required this.name,
    required this.pending,
    required this.today,
    required this.yesterday,
    required this.icon,
    required this.color,
  });
}
