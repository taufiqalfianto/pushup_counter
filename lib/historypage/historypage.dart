import 'package:flutter/material.dart';
import 'package:pushup_counter/homepage/widget/containerwidth.dart';
import 'package:pushup_counter/theme.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
          child: ListView(
            children: [
              ContainerWidth(
                bgimage: 'images/Vector-1.png',
                bgcolor: wavebase3,
                title: 'PushUp',
                reps: '20 x 4 Reps',
              ),
              SizedBox(
                height: 15,
              ),
              ContainerWidth(
                bgimage: 'images/Vector-2.png',
                bgcolor: wavebase5,
                title: 'SitUp',
                reps: '20 x 4 Reps',
              ),
              SizedBox(
                height: 15,
              ),
              ContainerWidth(
                bgimage: 'images/Vector-3.png',
                bgcolor: wavebase1,
                title: 'PullUp',
                reps: '7 x 4 Reps',
              ),
              SizedBox(
                height: 15,
              ),
              ContainerWidth(
                bgimage: 'images/Vector-4.png',
                bgcolor: wavebase4,
                title: 'Lunges',
                reps: '20 x 4 Reps',
              ),
              SizedBox(
                height: 15,
              ),
              ContainerWidth(
                bgimage: 'images/Vector-5.png',
                bgcolor: wavebase2,
                title: 'Running',
                reps: '3000 M',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
