import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/widgets/textfield.dart';

class FSODateWidget extends StatefulWidget {
  final String? hintText;
  final void Function(DateTime, String) onDateChanged;
  const FSODateWidget({
    super.key,
    this.hintText,
    required this.onDateChanged,
  });

  @override
  State<FSODateWidget> createState() => _FSODateWidgetState();
}

class _FSODateWidgetState extends State<FSODateWidget> {
  DateTime selectedDate = DateTime.now();
  TextEditingController dateController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015),
      lastDate: DateTime(2050),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateController.text = DateFormat("dd MMMM, yyyy").format(picked);
      });
      widget.onDateChanged(selectedDate, dateController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _selectDate(context);
      },
      borderRadius: BorderRadius.circular(10.0),
      child: IgnorePointer(
        child: FSOTextField(
          hintText: widget.hintText ?? 'Date',
          controller: dateController,
        ),
      ),
    );
  }
}

class FSOTimeWidget extends StatefulWidget {
  final String? hintText;
  final void Function(TimeOfDay, String) onTimeChanged;
  const FSOTimeWidget({
    super.key,
    this.hintText,
    required this.onTimeChanged,
  });

  @override
  State<FSOTimeWidget> createState() => _FSOTimeWidgetState();
}

class _FSOTimeWidgetState extends State<FSOTimeWidget> {
  TimeOfDay selectedTime = TimeOfDay.now();
  TextEditingController timeController = TextEditingController();

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedS = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },
    );

    if (pickedS != null && pickedS != selectedTime) {
      setState(() {
        selectedTime = pickedS;
        timeController.text =
            "${pickedS.hourOfPeriod.toString().padLeft(2, '0')}:${pickedS.minute.toString().padLeft(2, '0')} ${pickedS.period.name.toUpperCase()}";
      });
      widget.onTimeChanged(selectedTime, timeController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _selectTime(context);
      },
      child: IgnorePointer(
        child: FSOTextField(
          hintText: widget.hintText ?? 'Time',
          controller: timeController,
        ),
      ),
    );
  }
}
