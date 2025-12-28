import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class FSODropdownWidget extends StatefulWidget {
  final String hintText;
  final List<String> options;
  final void Function(String?) onChanged;
  const FSODropdownWidget({
    super.key,
    required this.hintText,
    required this.options,
    required this.onChanged,
  });

  @override
  State<FSODropdownWidget> createState() => _FSODropdownWidgetState();
}

class _FSODropdownWidgetState extends State<FSODropdownWidget> {
  String? selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: const Color(0xFFCCCACA),
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: DropdownButton<String>(
        items: widget.options.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (_) {
          setState(() {
            selected = _;
          });
          widget.onChanged(_);
        },
        borderRadius: BorderRadius.circular(8.0),
        elevation: 0,
        underline: const SizedBox(),
        value: selected,
        hint: Text(
          widget.hintText,
          style: const TextStyle(
            fontFamily: 'DMSans',
            fontWeight: FontWeight.w500,
            fontSize: 15.0,
            color: AppColors.kGreyColor,
          ),
        ),
        dropdownColor: Colors.white,
        isExpanded: true,
        icon: const Icon(
          Icons.expand_more,
          color: Color(0xFFCCCACA),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
      ),
    );
  }
}
