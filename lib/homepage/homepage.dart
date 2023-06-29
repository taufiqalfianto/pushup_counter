import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:pushup_counter/historypage/historypage.dart';
import 'package:pushup_counter/homepage/widget/containerheight.dart';
import 'package:pushup_counter/homepage/widget/containerwidth.dart';
import 'package:pushup_counter/pushup/pushuppage.dart';
import 'package:pushup_counter/theme.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  var date = DateFormat("MMMM, dd, yyyy").format(DateTime.now());
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: ListView(
            children: [
              //header
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome, Taufiq',
                        style: blacktextstyle.copyWith(
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'Ready Workout Today',
                        style: blacktextstyle.copyWith(
                          fontSize: 16,
                          fontWeight: bold,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      MaterialPageRoute(
                        builder: (context) => PushUp(),
                      );
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: basechoco,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 24,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ContainerHeight(),
                    ContainerHeight(),
                    ContainerHeight(),
                    ContainerHeight(),
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                'Workout Program',
                style: blacktextstyle.copyWith(
                  fontSize: 16,
                  fontWeight: bold,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              CustomCheckBoxGroup(
                buttonTextStyle: ButtonTextStyle(
                  selectedColor: lightbase,
                  unSelectedColor: basechoco,
                  textStyle:
                      blacktextstyle.copyWith(fontSize: 14, fontWeight: bold),
                ),
                unSelectedColor: Colors.white,
                selectedBorderColor: Colors.white,
                unSelectedBorderColor: basechoco,
                selectedColor: basechoco,
                buttonLables: [
                  "All Body",
                  "Chest",
                  "Upper Body",
                  "Back",
                  "Cardio",
                  "Lower Body",
                ],
                buttonValuesList: [
                  "All Body",
                  "Chest",
                  "Upper Body",
                  "Back",
                  "Cardio",
                  "Lower Body",
                ],
                checkBoxButtonValues: (values) {
                  print(values);
                },
                spacing: 0,
                horizontal: false,
                enableButtonWrap: false,
                autoWidth: true,
                padding: 10,
                enableShape: true,
              ),
              SizedBox(
                height: 24,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PushUp(),
                          ),
                        );
                      },
                      child: ContainerWidth(
                        bgimage: 'images/Vector-1.png',
                        bgcolor: wavebase3,
                        title: 'PushUp',
                        reps: '20 x 4 Reps',
                      ),
                    ),
                    ContainerWidth(
                      bgimage: 'images/Vector-2.png',
                      bgcolor: wavebase5,
                      title: 'SitUp',
                      reps: '20 x 4 Reps',
                    ),
                    ContainerWidth(
                      bgimage: 'images/Vector-3.png',
                      bgcolor: wavebase1,
                      title: 'PullUp',
                      reps: '7 x 4 Reps',
                    ),
                    ContainerWidth(
                      bgimage: 'images/Vector-4.png',
                      bgcolor: wavebase4,
                      title: 'Lunges',
                      reps: '20 x 4 Reps',
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

              SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Text(
                    'History Workout',
                    style: blacktextstyle.copyWith(
                      fontSize: 16,
                      fontWeight: bold,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HistoryPage(),
                        ),
                      );
                    },
                    child: Text(
                      'See All History',
                      style: blacktextstyle.copyWith(
                        fontSize: 12,
                        fontWeight: medium,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ContainerWidth(
                      bgimage: 'images/Vector-1.png',
                      bgcolor: wavebase3,
                      title: date,
                      reps: '',
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
