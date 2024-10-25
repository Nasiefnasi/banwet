import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

import '../Style/const.dart';
import '../utils/validators.dart';

// class DateTimePickers extends StatelessWidget {
//   DateTimePickers(
//       {super.key,
//       required this.controller,
//       required this.label,
//       this.validator});
//   final TextEditingController controller;
//   String? Function(String?)? validator;
//   final String label;
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: DateTimePicker(
//         style: header11,

//         autofocus: false,
//         controller: controller,
//         //  initialValue: '',
//         firstDate: DateTime(2000),
//         lastDate: DateTime.now(),
//         // dateLabelText: 'Start Date',

//         decoration: InputDecoration(
//           icon: const Icon(
//             Icons.event_note,
//             color: Colors.grey,
//           ),
//           labelText: label,
//           labelStyle: header11.copyWith(color: Colors.black54),
//           enabledBorder: const UnderlineInputBorder(
//             borderSide: BorderSide(color: Colors.black26, width: 1.0),
//           ),
//         ),
//         // dateLabelText: 'Start Date',
//         onChanged: (val) {
//           // setState(() {
//           // });
//         },
//         validator: validator,
//         onSaved: (val) {},
//       ),
//     );
//   }
// }

class DateTimePickers extends StatelessWidget {
  DateTimePickers({
    Key? key,
    required this.controller,
    required this.label,
    this.labelStyle,
    this.validator,
    this.style,
    this.enabledBorder,
    this.color,
    this.onChanged,
    this.onpick,
    this.firstdate,
    this.bodercolor,
    this.lastdate,
  }) : super(key: key);

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String label;
  final onpick;
  final labelStyle;
  final style;
  final enabledBorder;
  Function(String)? onChanged;
  final firstdate;
  final lastdate;
  final color;
  final bodercolor;
  @override
  Widget build(BuildContext context) {
    return DateTimePicker(
      // initialDate: DateTime(2022),
      style: style ??
          const TextStyle(
            fontSize: 18,
          ), // Use appropriate text style here
      autofocus: false,
      controller: controller,
      firstDate: firstdate ?? DateTime(2000),
      lastDate: lastdate ?? DateTime.now(),
      decoration: InputDecoration(
        icon: SizedBox(
            height: 20,
            child: Image.asset(
              "assets/images/dateicons.png",
              color: color,
            )),
        // Icon(
        //   Icons.calendar_month_outlined,
        //   color: color ?? Colors.grey,
        // ),
        labelText: label,
        labelStyle: labelStyle ??
            header11.copyWith(
              color: Colors.black54,
            ),
        border: enabledBorder,
        errorBorder: enabledBorder,
        focusedBorder: enabledBorder,
        disabledBorder: enabledBorder,
        focusedErrorBorder: enabledBorder,
        enabledBorder: enabledBorder ??
            UnderlineInputBorder(
              borderSide:
                  BorderSide(color: bodercolor ?? Colors.black26, width: 1.0),
            ),
      ),
      onChanged: onChanged,
      validator: validator,
      onSaved: (val) {},
    );
  }
}

class DateTimePickers2 extends StatelessWidget {
  DateTimePickers2(
      {super.key,
      required this.controller,
      required this.label,
      this.validator});
  final TextEditingController controller;
  String? Function(String?)? validator;
  final String label;
  @override
  Widget build(BuildContext context) {
    return DateTimePicker(
      style: header11,

      autofocus: false,
      controller: controller,
      //  initialValue: '',
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
      // dateLabelText: 'Start Date',

      decoration: InputDecoration(
        icon: Icon(
          Icons.calendar_month_outlined,
          color: Colors.grey.shade400,
        ),
        labelText: label,
        labelStyle: header11.copyWith(color: Colors.black54),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black26, width: 1.0),
        ),
      ),
      // dateLabelText: 'Start Date',
      onChanged: (val) {
        // setState(() {
        // });
      },
      validator: Validators.noneEmptyValidator,
      onSaved: (val) {},
    );
  }
}

class SubTaskAddDate extends StatelessWidget {
  SubTaskAddDate({
    Key? key,
    required this.controller,
    required this.label,
    this.labelStyle,
    this.validator,
    this.style,
    this.enabledBorder,
    this.onChanged,
    this.firstdate,
    this.lastdate,
  }) : super(key: key);

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String label;
  final labelStyle;
  final style;
  final enabledBorder;
  Function(String)? onChanged;
  final firstdate;
  final lastdate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            w2,
            SizedBox(
                height: 3, child: Image.asset("assets/images/dateicons.png")),
            w3,
            Expanded(
              child: DateTimePicker(
                style: style ??
                    const TextStyle(
                      fontSize: 18,
                    ), // Use appropriate text style here
                autofocus: false,
                controller: controller,
                firstDate: firstdate ?? DateTime(2000),
                lastDate: lastdate ?? DateTime.now(),
                decoration: InputDecoration(
                  // prefix: const Icon(
                  //   Icons.calendar_month_outlined,
                  //   color: Colors.grey,
                  // ),
                  labelText: label,
                  labelStyle: labelStyle ??
                      header11.copyWith(
                        color: Colors.black26,
                      ),
                  border: enabledBorder,
                  errorBorder: enabledBorder,
                  focusedBorder: enabledBorder,
                  disabledBorder: enabledBorder,
                  focusedErrorBorder: enabledBorder,
                  // enabledBorder: enabledBorder ??
                  //     const UnderlineInputBorder(
                  //       borderSide:
                  //           BorderSide(color: Colors.black26, width: 1.0),
                  //     ),
                ),
                onChanged: onChanged,
                validator: validator,
                onSaved: (val) {},
              ),
            ),
          ],
        ),
        // const Divider(
        //   color: Colors.black26,
        //   thickness: 1,
        // )
      ],
    );
  }
}
