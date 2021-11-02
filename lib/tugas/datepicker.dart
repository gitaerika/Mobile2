import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime _selectedDate = DateTime.now();
  final DateFormat _dateFormat = DateFormat('dd-MM-yyyy');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Date Picker'),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.red,
              ),
              onPressed: () {
                _getDate(context);
              },
            ),
            SizedBox(
              height: 15,
            ),
            Text('Date Value : '+_dateFormat.format(_selectedDate),
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  _getDate(context) async {
    final _datePick = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: _selectedDate.subtract(Duration(days: 30)
        ),
        lastDate: DateTime(_selectedDate.year + 1),
    );

    if(_datePick != null) {
      setState(() {
        _selectedDate = _datePick;
      });
    }
  }
}