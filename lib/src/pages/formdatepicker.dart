import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class FormDatePicker extends StatefulWidget {
  final DateTime date;
  final String title;
  final ValueChanged<DateTime> onChanged;

  const FormDatePicker({
    this.date,
    this.title,
    this.onChanged,
  });

  @override
  FormDatePickerState createState() => FormDatePickerState();
}

class FormDatePickerState extends State<FormDatePicker> {
  @override
  Widget build(BuildContext context) {
    if (widget.title == null) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Data',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                intl.DateFormat.yMd().format(widget.date),
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          ),
          TextButton(
            child: const Text('Edit'),
            onPressed: () async {
              var newDate = await showDatePicker(
                context: context,
                initialDate: widget.date,
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
              );

              // Don't change the date if the date picker returns null.
              if (newDate == null) {
                return;
              }

              widget.onChanged(newDate);
            },
          )
        ],
      );
    } else {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                widget.title,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                intl.DateFormat.yMd().format(widget.date),
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          ),
          TextButton(
            child: const Text('Edit'),
            onPressed: () async {
              var newDate = await showDatePicker(
                context: context,
                initialDate: widget.date,
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
              );

              // Don't change the date if the date picker returns null.
              if (newDate == null) {
                return;
              }

              widget.onChanged(newDate);
            },
          )
        ],
      );
    }
  }
}
