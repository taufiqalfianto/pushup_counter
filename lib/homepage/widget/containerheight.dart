import 'package:flutter/material.dart';
import 'package:pushup_counter/theme.dart';

// ignore: must_be_immutable
class ContainerHeight extends StatelessWidget {
  String image;
  String title;
  Color bgcolor;
  Color color;
  ContainerHeight({
    super.key,
    required this.image,
    required this.title,
    required this.bgcolor,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      width: 150,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: bgcolor.withOpacity(0.5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
                image: DecorationImage(
                    image: AssetImage(
                      image,
                    ),
                    scale: 45),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: blacktextstyle.copyWith(
                fontSize: 18,
                fontWeight: bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
