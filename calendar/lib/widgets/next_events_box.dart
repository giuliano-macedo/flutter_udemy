import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class NextEventsBox extends StatelessWidget {
  Widget eventCircle(BuildContext context, String text, DateTime date) {
    final now = DateTime.now();
    final daysLeft = now.difference(date).inDays;
    double percent = 0;
    return CircularPercentIndicator(
      radius: 75.0,
      lineWidth: 5.0,
      percent: percent,
      center: new Text(
        text,
        textScaleFactor: 1.25,
      ),
      progressColor: Theme.of(context).primaryColorDark,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(
          4,
          (index) => Expanded(
              child: eventCircle(context, "Event ${index + 1}",
                  DateTime.now().add(Duration(days: 10))))),
    );
  }
}
