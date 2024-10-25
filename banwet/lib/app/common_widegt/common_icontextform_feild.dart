// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import '../Style/const.dart';

class NewCaseTextField extends StatelessWidget {
  NewCaseTextField(
      {Key? key,
      this.minlines,
      required this.mediaquery,
      this.hinttexts,
      required this.controller,
      this.readOnly,
      required this.keyboard,
      this.prefix,
      this.validator,
      // required this.error,
      this.sufixicon,
      // required this.obscuretext,
      this.onChanged,
      this.maxLine,
      this.label,
      this.bordercolor,
      this.descrip,
      this.icon,
      this.labelstyle,
      this.initialValue})
      : super(key: key);
  bool? readOnly;
  final descrip;
  final Size mediaquery;
  // final dynamic error;
  final String? hinttexts;
  int? maxLine;
  final label;
  String? initialValue;
  final TextEditingController controller;
  final Widget? sufixicon;
  final Widget? icon;
  final dynamic validator;
  final bordercolor;
  final TextInputType keyboard;
  final prefix;
  final labelstyle;

  final minlines;
  // final bool obscuretext;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    final errorText = validator != null ? validator(controller.text) : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          // height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            // border: Border.all(
            //     width: 1, color: Colors.black12), // Black border color
            // color: const Color.fromARGB(31, 255, 255, 255).withOpacity(0.02),
            borderRadius: BorderRadius.circular(12),
          ),
          // width: mediaquery.width * 9,
          child: Padding(
            padding: const EdgeInsets.symmetric(),
            child: TextFormField(
              initialValue: initialValue,
              textInputAction: descrip,
              style: header11.copyWith(fontFamily: Medium, fontSize: 11.sp),
              readOnly: readOnly ?? false,
              onChanged: onChanged,
              maxLines: maxLine,
              minLines: minlines ?? 1,
              keyboardType: keyboard,
              controller: controller,
              validator: validator,
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(right: 20),
                icon: icon, labelText: label,
                labelStyle: labelstyle ??
                    header11.copyWith(
                      color: Colors.black87,
                    ),
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.grey.withOpacity(0.5),
                //     spreadRadius: 5,
                //     blurRadius: 7,
                //     offset: Offset(0, 3), // changes position of shadow
                //   ),
                // ],
                fillColor: const Color.fromARGB(255, 255, 255, 255),
                filled: true,
                suffixIcon: sufixicon,
                prefixIcon: prefix,
                // prefixIcon: Icon(

                //   size: 20,
                //   color: Colors.black12,
                // ),
                // disabledBorder: const OutlineInputBorder(
                //   borderSide: const BorderSide(
                //       color:
                //           // error == false
                //           //     ? textfeildcolorStroke
                //           //     :
                //           Color.fromARGB(
                //               255, 248, 134, 134)), // Black border color
                //   borderRadius: BorderRadius.all(Radius.circular(12)),
                // ),
                // errorBorder: const OutlineInputBorder(
                //   borderSide: BorderSide(
                //       color:
                //           //  error == false
                //           //     ? textfeildcolorStroke
                //           //     :
                //           Color.fromARGB(255, 248, 134, 134)),
                //   // borderSide: BorderSide(
                //   //     width: 1,
                //   //     color: Color.fromARGB(
                //   //         255, 248, 134, 134)), // Black border color
                //   borderRadius: BorderRadius.all(
                //     Radius.circular(12),
                //   ),
                // ),
                // focusedBorder: const OutlineInputBorder(
                //   borderSide:
                //       BorderSide(color: Color.fromARGB(255, 248, 134, 134)),
                //   // borderSide: BorderSide(
                //   //     color: textfeildcolorStroke), // Black border color
                //   borderRadius: BorderRadius.all(Radius.circular(12)),
                // ),
                // enabledBorder: const OutlineInputBorder(
                //   borderSide:
                //       BorderSide(color: Color.fromARGB(255, 248, 134, 134)),
                //   // borderSide: BorderSide(
                //   //     width: 1,
                //   //     color: textfeildcolorStroke), // Black border color
                //   borderRadius: BorderRadius.all(Radius.circular(12)),
                // ),
                // border: const OutlineInputBorder(
                //   borderSide:
                //       BorderSide(color: Color.fromARGB(255, 248, 134, 134)),
                //   // borderSide: BorderSide(
                //   //   color: textfeildcolorStroke,
                //   // ), // Black border color
                //   borderRadius: BorderRadius.all(Radius.circular(12)),
                // ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      width: 1, color: bordercolor ?? Colors.black26),
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                      width: 1, color: bordercolor ?? Colors.black26),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      width: 1, color: bordercolor ?? Colors.black26),
                ),
                // errorBorder: OutlineInputBorder(
                //   borderSide:
                //       BorderSide(color: Colors.black), // Black border color
                //   borderRadius: BorderRadius.all(Radius.circular(12)),
                // ),
                hintText: initialValue,
                hintStyle: header11.copyWith(
                  color: Colors.black54,
                ),
                //  TextStyle(
                //   fontFamily: regular,
                //   color: Colors.black38,
                //   fontWeight: FontWeight.w400,
                //   fontSize: 16,
                // ),
                errorStyle: const TextStyle(
                  fontSize: 12, // Adjust the font size
                  height: 0.01, // Adjust the height
                  color: Color.fromARGB(255, 219, 199, 198), // Adjust the color
                ),
                // fillColor: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CommonIconTextFormField extends StatelessWidget {
  CommonIconTextFormField(
      {super.key,
      required this.controller,
      required this.mediaquery,
      required this.keyboard,
      required this.label,
      this.initialValue,
      this.validator,
      this.maxLine,
      this.readOnly,
      this.contentPadding,
      this.onChanged,
      required this.icon,
      this.borderColor,
      this.lablestyle,
      this.style});
  final TextEditingController controller;
  final TextInputType keyboard;
  final validator;
  final contentPadding;
  final String label;
  String? initialValue;
  final Widget icon;
  int? maxLine;
  final Size mediaquery;
  bool? readOnly;
  final borderColor;
  final style;
  final lablestyle;
  void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    final errorText = validator != null ? validator(controller.text) : null;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          // height: 50,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: TextFormField(
                //  autovalidateMode: AutovalidateMode.onUserInteraction,
                style: style ??
                    TextStyle(
                      fontFamily: light,
                    ),
                // initialValue: initialValue,
                readOnly: readOnly ?? false,
                onChanged: onChanged,
                keyboardType: keyboard,
                maxLines: maxLine,
                controller: controller,
                validator: validator,
                decoration: InputDecoration(
                  errorStyle: validator != null
                      ? null
                      : const TextStyle(
                          height: 0,
                          wordSpacing: 0.0,
                          fontSize: 0,
                          color: Colors.transparent),
                  hintText: initialValue,
                  hintStyle: TextStyle(
                    fontFamily: light,
                  ),
                  labelText: label,
                  labelStyle: lablestyle ??
                      header10.copyWith(
                          color: Colors.black87, fontFamily: light),
                  icon: icon,
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        width: 1, color: borderColor ?? Colors.black26),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                        width: 1, color: borderColor ?? Colors.black26),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        width: 1, color: borderColor ?? Colors.black26),
                  ),
                )),
          ),
        ),
      ],
    );
  }
}

// class CustomTextFormFields extends StatelessWidget {
//   const CustomTextFormFields({
//     Key? key,
//     required this.mediaquery,
//     this.hinttexts, this.label,
//     this.icons,
//     required this.controller,
//      required this.keyboard,
//     this.validator,
//     required this.error,
//     this.sufixicon,
//     required this.obscuretext,
//   }) : super(key: key);

//   final Size mediaquery;
//   final dynamic error;
//   final String? hinttexts;
//   final IconData? icons;
//   final TextEditingController controller;
//   final Widget? sufixicon;
//   final validator;
//   final TextInputType keyboard;
//   final bool obscuretext;
//  final String? label;

//   @override
//   Widget build(BuildContext context) {
//     final errorText = validator != null ? validator(controller.text) : null;

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           height: 60,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             // border: Border.all(
//             //     width: 1, color: Colors.black12), // Black border color
//             // color: const Color.fromARGB(31, 255, 255, 255).withOpacity(0.02),
//             borderRadius: BorderRadius.circular(12),
//           ),
//           width: mediaquery.width * 0.85,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(),
//             child: TextFormField(
//               obscureText: obscuretext,
//               obscuringCharacter: "*",
//               keyboardType: keyboard,
//               controller: controller,
//               validator: validator,
//               textAlign: TextAlign.left,
//               minLines: 1,
//               decoration: InputDecoration(label: label, labelStyle: header10.copyWith(
//                         color: Colors.black87, fontFamily: light),
//                 focusedBorder: const UnderlineInputBorder(
//                   borderSide: BorderSide(width: 1, color: Colors.black26),
//                 ),
//                 border: const UnderlineInputBorder(
//                   borderSide: BorderSide(width: 1, color: Colors.black26),
//                 ),
//                 enabledBorder: const UnderlineInputBorder(
//                   borderSide: BorderSide(width: 1, color: Colors.black26),
//                 ),
//                 errorBorder: const UnderlineInputBorder(
//                   borderSide: BorderSide(width: 1, color: Colors.red),
//                 ),
//                 focusedErrorBorder: const UnderlineInputBorder(
//                   borderSide: BorderSide(width: 1, color: Colors.black26),
//                 ),
//                 disabledBorder: const UnderlineInputBorder(
//                   borderSide: BorderSide(width: 1, color: Colors.black26),
//                 ),
//                 // boxShadow: [
//                 //   BoxShadow(
//                 //     color: Colors.grey.withOpacity(0.5),
//                 //     spreadRadius: 5,
//                 //     blurRadius: 7,
//                 //     offset: Offset(0, 3), // changes position of shadow
//                 //   ),
//                 // ],
//                 fillColor: const Color.fromARGB(255, 255, 255, 255), filled: true,
//                 suffixIcon: sufixicon,
//                 prefixIcon: Icon(
//                   icons,
//                   size: 20,
//                   color: Colors.black12,
//                 ),
//                 // disabledBorder: OutlineInputBorder(
//                 //   borderSide: BorderSide(
//                 //       color: error == false
//                 //           ? textfeildcolorStroke
//                 //           : Color.fromARGB(
//                 //               255, 248, 134, 134)), // Black border color
//                 //   borderRadius: BorderRadius.all(Radius.circular(12)),
//                 // ),
//                 // errorBorder: OutlineInputBorder(
//                 //   borderSide: BorderSide(
//                 //       color:
//                 //           //  error == false
//                 //           //     ? textfeildcolorStroke
//                 //           //     :
//                 //           Color.fromARGB(255, 248, 134, 134)),
//                 //   // borderSide: BorderSide(
//                 //   //     width: 1,
//                 //   //     color: Color.fromARGB(
//                 //   //         255, 248, 134, 134)), // Black border color
//                 //   borderRadius: BorderRadius.all(
//                 //     Radius.circular(12),
//                 //   ),
//                 // ),
//                 // focusedBorder: OutlineInputBorder(
//                 //   borderSide: BorderSide(
//                 //       color: error == false
//                 //           ? textfeildcolorStroke
//                 //           : Color.fromARGB(255, 248, 134, 134)),
//                 //   // borderSide: BorderSide(
//                 //   //     color: textfeildcolorStroke), // Black border color
//                 //   borderRadius: BorderRadius.all(Radius.circular(12)),
//                 // ),
//                 // enabledBorder: OutlineInputBorder(
//                 //   borderSide: BorderSide(
//                 //       color: error == false
//                 //           ? textfeildcolorStroke
//                 //           : Color.fromARGB(255, 248, 134, 134)),
//                 //   // borderSide: BorderSide(
//                 //   //     width: 1,
//                 //   //     color: textfeildcolorStroke), // Black border color
//                 //   borderRadius: BorderRadius.all(Radius.circular(12)),
//                 // ),
//                 // border: OutlineInputBorder(
//                 //   borderSide: BorderSide(
//                 //       color: error == false
//                 //           ? textfeildcolorStroke
//                 //           : Color.fromARGB(255, 248, 134, 134)),
//                 //   // borderSide: BorderSide(
//                 //   //   color: textfeildcolorStroke,
//                 //   // ), // Black border color
//                 //   borderRadius: BorderRadius.all(Radius.circular(12)),
//                 // ),
//                 // errorBorder: OutlineInputBorder(
//                 //   borderSide:
//                 //       BorderSide(color: Colors.black), // Black border color
//                 //   borderRadius: BorderRadius.all(Radius.circular(12)),
//                 // ),

//                 // ),
//                 hintText: hinttexts.toString(),
//                 hintStyle: TextStyle(
//                   fontFamily: regular,
//                   color: Colors.black38,
//                   fontWeight: FontWeight.w400,
//                   fontSize: 16,
//                 ),
//                 errorStyle: const TextStyle(
//                   fontSize: 12, // Adjust the font size
//                   height: 0.01, // Adjust the height
//                   color: Color.fromARGB(255, 219, 199, 198), // Adjust the color
//                 ),
//                 // fillColor: Colors.white,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }


// // class CommonIconTextFormField extends StatelessWidget {
  
// //   CommonIconTextFormField({
//     Key? key,
//     required this.mediaquery,
//     this.hinttexts,
//     this.icons,
//     this.controller,
//     this.keyboard,
//     this.validator,
//     this.sufixicon,
//     this.inputFormatter,
//     this.errorcolors,
//     this.boxcolor,
//     this.contentPadding,
//     this.bordercolor,
//     this.initialValue,
    
//     this.readOnly,
//     this.maxLine,
//     this.minline,
//     this.label,
//     this.onChanged,
//     this.icon,
//   }) : super(key: key);

//   final Size mediaquery;

//   final String? hinttexts;
//   final errorcolors;
//   final icons;
//   final controller;
//   final Widget? sufixicon;
//   final validator;
//   final keyboard;
//   final inputFormatter;
//   final boxcolor;
//   final contentPadding;
//   final bordercolor;

//   int? maxLine ;
//   int? minline ;
//   final initialValue;
//   final readOnly;
//   final label;
//   final icon;
//   void Function(String)? onChanged;

//   @override
//   Widget build(BuildContext context) {
    
//     final errorText = validator != null ? validator(controller.text) : null;

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           height: 60,
//           decoration: BoxDecoration(
//             color: boxcolor ?? Colors.white,
//             // border: Border.all(
//             //     width: 1, color: Colors.black12), // Black border color
//             // color: const Color.fromARGB(31, 255, 255, 255).withOpacity(0.02),
//             borderRadius: BorderRadius.circular(12),
//           ),
//           width:  mediaquery.width * 0.85,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(),
//             child: TextFormField(
//               readOnly: readOnly,
//               onChanged: onChanged,
//               style: header11,
//               initialValue: initialValue,
//               // obscureText: obscureText,
//               inputFormatters: inputFormatter,
//               keyboardType: keyboard,
//               controller: controller,
//               validator: validator??"",
//               textAlign: TextAlign.left,
//               minLines: minline ?? 1,
//               maxLines: maxLine ?? 1,
//               decoration: InputDecoration(
//                 labelText: label, icon: icon,
//                 labelStyle: header10.copyWith(
//                   color: Colors.black45,
//                 ),
//                 contentPadding: contentPadding,
//                 border: UnderlineInputBorder(
//                   borderSide: BorderSide(color: bColor),
//                 ),
//                 enabledBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(
//                       color: bordercolor ?? Colors.black87, width: 1.0),
//                 ),
//                 errorBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(
//                       style: BorderStyle.solid,
//                       color: errorcolors ?? Colors.red,
//                       // controller.errormessage.value ??
//                       //     Color.fromARGB(255, 211, 211, 211),
//                       width: 1),
//                 ),
//                 focusedErrorBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(
//                       style: BorderStyle.solid,
//                       color: errorcolors ?? Color.fromARGB(255, 211, 211, 211),
//                       width: 1),
//                 ),

//                 fillColor: boxcolor ?? const Color.fromARGB(255, 255, 255, 255),
//                 filled: true,
//                 suffixIcon: sufixicon,
//                 prefixIcon: icons,

//                 hintText: hinttexts??'',
//                 hintStyle: TextStyle(
//                   fontFamily: regular,
//                   color: Colors.black38,
//                   fontWeight: FontWeight.w400,
//                   fontSize: 16,
//                 ),
//                 errorStyle: const TextStyle(
//                   fontSize: 12, // Adjust the font size
//                   height: 0.01, // Adjust the height
//                   color: Color.fromARGB(255, 219, 199, 198), // Adjust the color
//                 ),
//                 // fillColor: Colors.white,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
