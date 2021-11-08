import 'package:flutter/material.dart';

class DrawerItem {
  final String name;
  final IconData icon;
  final Function()? action;

  const DrawerItem(this.name, this.icon, this.action);
}
