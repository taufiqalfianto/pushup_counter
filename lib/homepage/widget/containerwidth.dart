import 'package:flutter/material.dart';
import 'package:pushup_counter/theme.dart';

// ignore: must_be_immutable
class ContainerWidth extends StatelessWidget {
  String bgimage;
  Color bgcolor;
  String title;
  String reps;
  ContainerWidth({
    super.key,
    required this.bgimage,
    required this.bgcolor,
    required this.title,
    required this.reps,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      width: 300,
      height: 150,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(bgimage),
          alignment: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(20),
        color: bgcolor.withOpacity(0.4),
      ),
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: blacktextstyle.copyWith(
                fontSize: 24,
                fontWeight: bold,
              ),
            ),
            Text(
              reps,
              style: blacktextstyle.copyWith(
                fontSize: 18,
                fontWeight: medium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
