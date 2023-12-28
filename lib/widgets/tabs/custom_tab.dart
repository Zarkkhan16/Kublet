import 'package:flutter/material.dart';
import 'package:kublet/core/utils/colour_constants.dart';
import 'package:kublet/core/utils/size_utils.dart';

class CustomTab extends StatefulWidget {
  final String label;
  final bool isSelected;

  const CustomTab({
    Key? key,
    required this.label,
    required this.isSelected,
  }) : super(key: key);

  @override
  State<CustomTab> createState() => _CustomTabState();
}

class _CustomTabState extends State<CustomTab> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.adaptSize),
      decoration: BoxDecoration(
        color: widget.isSelected ? theme.colorScheme.primary : ColourConstants.darkGray,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.adaptSize),
        child: Text(
          widget.label,
          style: theme.textTheme.bodySmall!.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 15.fSize
          ),
        ),
      ),
    );
  }
}
