import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatetimePickerWidget extends StatefulWidget {
  @override
  _DatetimePickerWidgetState createState() => _DatetimePickerWidgetState();
}

class _DatetimePickerWidgetState extends State<DatetimePickerWidget> {
  DateTime dateTime;

  String getText() {
    if (dateTime == null) {
      return 'وقت تسليم الكرسي';
    } else {
      return DateFormat('HH:mm -- MM/dd/yyyy ').format(dateTime);
    }
  }

  @override
  Widget build(BuildContext context) => ButtonHeaderWidget(
        text: getText(),
        onClicked: () => pickDateTime(context),
      );

  Future pickDateTime(BuildContext context) async {
    final date = await pickDate(context);
    if (date == null) return;

    final time = await pickTime(context);
    if (time == null) return;

    setState(() {
      dateTime = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    });
  }

  Future<DateTime> pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: dateTime ?? initialDate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) return null;

    return newDate;
  }

  Future<TimeOfDay> pickTime(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 9, minute: 0);
    final newTime = await showTimePicker(
      context: context,
      initialTime: dateTime != null
          ? TimeOfDay(hour: dateTime.hour, minute: dateTime.minute)
          : initialTime,
    );

    if (newTime == null) return null;

    return newTime;
  }
}

class ButtonHeaderWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonHeaderWidget({
    Key key,
    this.text,
    this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => HeaderWidget(
        child: ButtonWidget(
          text: text,
          onClicked: onClicked,
        ),
      );
}

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key key,
    this.text,
    this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size.fromHeight(50),
            primary: Colors.white54,
          ),
          child: FittedBox(
            child: Text(
              text,
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
          onPressed: onClicked,
        ),
      );
}

class HeaderWidget extends StatelessWidget {
  final Widget child;

  const HeaderWidget({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          child,
        ],
      );
}
