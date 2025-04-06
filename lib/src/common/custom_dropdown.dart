// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatelessWidget {
  const CustomDropdown({
    super.key,
    this.width,
    this.leadingIcon,
    this.initialSelection,
    this.padding = const EdgeInsets.symmetric(vertical: 20),
    required this.label,
    this.tooltipMessage = '',
    required this.entries,
    required this.onSelected,
  });

  final double? width;
  final EdgeInsets padding;
  final Widget? leadingIcon;
  final String label;
  final String tooltipMessage;
  final List<DropdownMenuEntry<T>> entries;
  final T? initialSelection;
  final void Function(T?)? onSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Tooltip(
        message: entries.isNotEmpty ? tooltipMessage : label,
        child: DropdownMenu<T>(
          key: UniqueKey(),
          width: width,
          enabled: entries.isNotEmpty,
          leadingIcon: leadingIcon,
          label: Text(entries.isNotEmpty ? label : ' - '),
          enableSearch: false,
          requestFocusOnTap: false,
          dropdownMenuEntries: entries,
          initialSelection: initialSelection,
          onSelected: onSelected,
        ),
      ),
    );
  }
}
