import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:banwet/app/style/const.dart';

class NotificationListTile extends StatelessWidget {
  const NotificationListTile({
    Key? key,
    required this.title,
    required this.description,
    required this.notificationDate,
  }) : super(key: key);

  final String title;
  final String description;
  final String notificationDate;

  @override
  Widget build(BuildContext context) {
    // Parse the notification date
    DateTime parsedDate = DateFormat("dd-MM-yyyy").parse(notificationDate);
    // Get day and month strings
    String day = DateFormat("d").format(parsedDate);
    String month = DateFormat("MMM").format(parsedDate);

    return Column(
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: ColoredBox(
                color: bColor,
                child: SizedBox(
                  width: 66,
                  height: 66,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            day.toString(),
                            style: header2.copyWith(
                                color: Colors.white,
                                fontFamily: Medium,
                                fontSize: 18),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Align(
                          // alignment: Alignment.bottomCenter,
                          child: Text(
                            month.toString(),
                            style: header2.copyWith(
                                color: Colors.white,
                                fontFamily: regular,
                                fontSize: 15),
                          ),
                        ),
                      ),
                      h2
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title.toString(),
                    style: header2.copyWith(fontFamily: Medium, fontSize: 16),
                  ),
                  h1,
                  Text(description.toString(),
                      style:
                          header2.copyWith(fontSize: 14, fontFamily: regular)),
                ],
              ),
            )
          ],
        ),
        h2,
        const Divider(
          color: Colors.black12,
        )
      ],
    );
  }
}
