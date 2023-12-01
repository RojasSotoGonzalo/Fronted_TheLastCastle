// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerFormField extends StatefulWidget {
  final DateTime initialDate;
  final ValueChanged<DateTime> onChanged;

  const DatePickerFormField({
    Key? key,
    required this.initialDate,
    required this.onChanged,
  }) : super(key: key);

  @override
  _DatePickerFormFieldState createState() => _DatePickerFormFieldState();
}

class _DatePickerFormFieldState extends State<DatePickerFormField> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        widget.onChanged(_selectedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Formatear la fecha en el formato correcto
    String formattedDate = DateFormat("yyyy-MM-dd").format(_selectedDate);
    return TextFormField(
      readOnly: true,
      onTap: () => _selectDate(context),
      controller: TextEditingController(text: formattedDate),
      decoration: const InputDecoration(
        labelText: 'Fecha',
        prefixIcon: Icon(
          Icons.calendar_today,
          color: Color.fromARGB(255, 76, 9, 163), // Color del icono
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 3,
            color: Color.fromARGB(255, 83, 8, 168), // Color del borde
          ),
        ),
      ),
    );
  }
}
