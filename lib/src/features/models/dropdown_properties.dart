import 'package:flutter/material.dart';

abstract class DropdownProperties<T> {
  List<DropdownMenuEntry<T>> getDropdownEntries();
  void update(T selectedValue);
}
