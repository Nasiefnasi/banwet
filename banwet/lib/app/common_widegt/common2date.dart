import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

import '../Style/const.dart';

class Common2Date extends StatelessWidget {
  Common2Date({
    super.key,
    required this.statDate,
    required this.endDate,
    this.startDateValue,
    this.endDateValue,
    required this.onPressed,
    required this.ontap,
  });

  final TextEditingController statDate;
  final TextEditingController endDate;
  var startDateValue;
  var endDateValue;
  void Function() onPressed;
  void Function() ontap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DateTimePicker(
            autofocus: false,
            controller: statDate,
            firstDate: DateTime(2000),
            lastDate: DateTime.now(),
            selectableDayPredicate: (DateTime? day) {
              return endDateValue == null ||
                  ((day != null && day.isBefore(endDateValue!) ||
                      day!.isAtSameMomentAs(endDateValue!)));
            },
            decoration: InputDecoration(
              icon:
                  // Container(
                  //     height: 20.sp,
                  //     width: 20.sp,
                  //     child: Image.asset("assets/images/c")),
                  const Icon(
                Icons.calendar_month_rounded,
                color: Colors.black45,
              ),
              labelText: 'Start Date',
              labelStyle: header11.copyWith(color: Colors.black54),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black87, width: 1.0),
              ),
            ),
            onChanged: (val) {
              startDateValue = DateTime.parse(statDate.text);
              ontap();
              onPressed();
            },
            validator: (val) {
              return null;
            },
            onSaved: (val) {
              onPressed();
            },
          ),
        ),
        w5,
        Expanded(
          child: DateTimePicker(
            autofocus: false,
            controller: endDate,
            firstDate: DateTime(2000),
            lastDate: DateTime.now(),
            selectableDayPredicate: (DateTime? day) {
              return startDateValue == null ||
                  (day != null && day.isAtSameMomentAs(startDateValue!) ||
                      day!.isAfter(startDateValue!));
            },
            decoration: InputDecoration(
              icon: const Icon(
                Icons.calendar_month_rounded,
                color: Colors.black45,
              ),
              labelText: 'End Date',
              labelStyle: header11.copyWith(color: Colors.black54),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black87, width: 1.0),
              ),
            ),
            onChanged: (val) {
              endDateValue = DateTime.parse(endDate.text);
              ontap();
              onPressed();
            },
            validator: (val) {
              return null;
            },
            onSaved: (val) {
              onPressed();
            },
          ),
        ),
      ],
    );
  }
}

class HomeDate extends StatelessWidget {
  HomeDate(
      {super.key,
      required this.statDate,
      required this.endDate,
      this.startDateValue,
      this.endDateValue,
      required this.onPressed,
      required this.ontap,
      required this.startdatesout,
      required this.entdatesout,
      required this.startontap});

  final TextEditingController statDate;
  final TextEditingController endDate;
  var startDateValue;
  var endDateValue;
  void Function() onPressed;
  void Function() ontap;
  void Function(String?) startdatesout;
  void Function(String) entdatesout;
  void startontap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DateTimePicker(
            autofocus: false,
            controller: statDate,
            firstDate: DateTime(2000),
            lastDate: DateTime.now(),
            selectableDayPredicate: (DateTime? day) {
              return endDateValue == null ||
                  ((day != null && day.isBefore(endDateValue!) ||
                      day!.isAtSameMomentAs(endDateValue!)));
            },
            decoration: InputDecoration(
              icon:
                  // Container(
                  //     height: 20.sp,
                  //     width: 20.sp,
                  //     child: Image.asset("assets/images/c")),
                  const Icon(
                Icons.calendar_month_rounded,
                color: Colors.black45,
              ),
              labelText: 'Start Date',
              labelStyle: header11.copyWith(color: Colors.black54),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black87, width: 1.0),
              ),
            ),
            onChanged: (val) {
              startdatesout(val);
              print(val);
              startDateValue = DateTime.parse(statDate.text);
              ontap();
              onPressed();
            },
            validator: (val) {
              return null;
            },
            onSaved: (val) {
              startdatesout(val!);
              onPressed();
            },
          ),
        ),
        w5,
        Expanded(
          child: DateTimePicker(
            autofocus: false,
            controller: endDate,
            firstDate: DateTime(2000),
            lastDate: DateTime.now(),
            selectableDayPredicate: (DateTime? day) {
              return startDateValue == null ||
                  (day != null && day.isAtSameMomentAs(startDateValue!) ||
                      day!.isAfter(startDateValue!));
            },
            decoration: InputDecoration(
              icon: const Icon(
                Icons.calendar_month_rounded,
                color: Colors.black45,
              ),
              labelText: 'End Date',
              labelStyle: header11.copyWith(color: Colors.black54),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black87, width: 1.0),
              ),
            ),
            onChanged: (val) {
              endDateValue = DateTime.parse(endDate.text);
              entdatesout(val);
              ontap();
              onPressed();
            },
            validator: (val) {
              return null;
            },
            onSaved: (val) {
              entdatesout(val!);
              onPressed();
            },
          ),
        ),
      ],
    );
  }
}
