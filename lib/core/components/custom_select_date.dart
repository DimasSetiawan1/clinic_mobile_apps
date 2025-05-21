import 'package:flutter/material.dart';

class CustomTimeField extends StatefulWidget {
  final bool isStart;
  final TimeOfDay? startTime;
  final TimeOfDay? endTime;
  final Function(BuildContext, bool) selectTime;

  const CustomTimeField({
    Key? key,
    required this.isStart,
    required this.startTime,
    required this.endTime,
    required this.selectTime,
  }) : super(key: key);

  @override
  _CustomTimeFieldState createState() => _CustomTimeFieldState();
}

class _CustomTimeFieldState extends State<CustomTimeField> {
  late TimeOfDay? _selectedTime;

  @override
  void initState() {
    super.initState();
    _selectedTime = widget.isStart ? widget.startTime : widget.endTime;
  }

  @override
  Widget build(BuildContext context) {
    return FormField<TimeOfDay>(
      initialValue: _selectedTime,
      validator: (value) {
        if (value == null) {
          return 'Waktu harus diisi';
        }
        return null;
      },
      builder: (FormFieldState<TimeOfDay> state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () async {
                await widget.selectTime(context, widget.isStart);
                setState(() {
                  _selectedTime =
                      widget.isStart ? widget.startTime : widget.endTime;
                });
                state.didChange(_selectedTime);
              },
              child: Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      color: state.hasError ? Colors.red : Colors.grey),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.schedule,
                      size: 24.0,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      _selectedTime != null
                          ? _selectedTime!.format(context)
                          : (widget.isStart ? "Mulai" : "Selesai"),
                      style: const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (state.hasError)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  state.errorText!,
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
          ],
        );
      },
    );
  }
}
