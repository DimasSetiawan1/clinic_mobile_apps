import 'package:clinic_mobile_apps/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FilterTelemedisStatus extends StatefulWidget {
  const FilterTelemedisStatus({super.key});

  @override
  State<FilterTelemedisStatus> createState() => _State();
}

class _State extends State<FilterTelemedisStatus> {
  final List<String> _statusList = ['Semua', 'Berlangsung', 'Selesai'];
  String? _selectedStatus;

  @override
  void initState() {
    _selectedStatus = _statusList.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(_statusList.length, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GestureDetector(
            onTap: () {
              setState(() {
                _selectedStatus = _statusList[index];
              });
            },
            child: Container(
              height: 26,
              width: 80,
              padding: const EdgeInsets.symmetric(horizontal: 2),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color:
                    _selectedStatus == _statusList[index]
                        ? AppColors.primary
                        : const Color(0xffEFF2F1),
              ),
              child: Center(
                child: Text(
                  _statusList[index],
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color:
                        _selectedStatus == _statusList[index]
                            ? AppColors.white
                            : Color(0xffA7A6A5),
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
