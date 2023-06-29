import 'package:flutter/material.dart';
import 'package:pushup_counter/theme.dart';

class ContainerHeight extends StatelessWidget {
  const ContainerHeight({super.key});

  @override
  Widget build(BuildContext context) {
     return Container(
      margin: EdgeInsets.only(right: 10),
      width: 150,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: basechoco,
      ),
    );
  }
}