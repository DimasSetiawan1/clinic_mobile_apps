import 'package:clinic_mobile_apps/core/components/widgets/spaces.dart';
import 'package:flutter/material.dart';

Widget buildRadioOptions(
  String title,
  List<String> options,
  String? selectedValue,
  void Function(String?) onChanged,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
            fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.black),
      ),
      const SpaceHeight(8),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          options.length,
          (index) =>
              _buildRadioOption(options[index], selectedValue, onChanged),
        ),
      )
    ],
  );
}

Widget _buildRadioOption(
  String option,
  String? groupValue,
  Function(String?) onChanged,
) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Radio<String>(
        value: option,
        groupValue: groupValue,
        onChanged: (value) {
          if (value != null) {
            onChanged(value);
          }
        },
        activeColor: Colors.blue,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      GestureDetector(
        onTap: () {
          onChanged(option);
        },
        child: Text(
          option,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
            color: Color(0xff677294),
          ),
        ),
      ),
    ],
  );
}
