import 'dart:async';

import 'package:body_detection/body_detection.dart';
import 'package:body_detection/models/image_result.dart';
import 'package:body_detection/models/pose.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PushUp extends StatefulWidget {
  const PushUp({Key? key}) : super(key: key);

  @override
  State<PushUp> createState() => _PushUpState();
}

class _PushUpState extends State<PushUp> {
  double wristY = 0.0;
  double shoulderY = 0.0;
  double pushUpCount = 0;
  Pose? _detectedPose;
  bool up = false;
  var _cameraImage;
  bool down = true;
  Timer second = Timer(Duration(seconds: 1), () {});

  FutureOr<void> _startCameraStream() async {
    final request = await Permission.camera.request();
    if (request.isGranted) {
      await BodyDetection.startCameraStream(
        onFrameAvailable: _handleCameraImage,
        onPoseAvailable: (pose) {
          _handlePose(pose);
          if (_detectedPose != null) {
            if (_detectedPose!.landmarks.isNotEmpty) {
              if (down) {
                if (_detectedPose!.landmarks[10].position.x ==
                        _detectedPose!.landmarks[11].position.y ||
                    _detectedPose!.landmarks[10].position.x >
                        _detectedPose!.landmarks[11].position.y) {
                  pushUpCount = pushUpCount + 0.5;
                  setState(() {
                    down = !down;
                    up = true;
                  });
                }
              } else if (up) {
                if (_detectedPose!.landmarks[10].position.y <
                    _detectedPose!.landmarks[11].position.y) {
                  pushUpCount = pushUpCount + 0.5;
                  setState(() {
                    up = !up;
                    down = true;
                  });
                }
              }
              // if (up) {
              //   if (_detectedPose!.landmarks[11].position.x ==
              //           _detectedPose!.landmarks[13].position.y ||
              //       _detectedPose!.landmarks[11].position.y <
              //           _detectedPose!.landmarks[13].position.x) {
              //     pushUpCount = pushUpCount + 0.5;

              //     setState(() {
              //       up = !up;
              //       up = true;
              //     });
              //   }
              // } else if (down) {
              //   if (_detectedPose!.landmarks[11].position.y >
              //       _detectedPose!.landmarks[12].position.x) {
              //     pushUpCount = pushUpCount + 0.5;
              //     setState(() {
              //       down = !down;
              //       down = true;
              //     });
              //   }
              // }
            }
          }
        },
        onMaskAvailable: (mask) {},
      );
    }
  }

  Future<void> _stopcamre() async {
    final request = await Permission.camera.request();
    if (request.isGranted) {
      await BodyDetection.stopCameraStream();
    }
  }

  void _handleCameraImage(ImageResult result) {
    if (!mounted) return;

    PaintingBinding.instance.imageCache.clear();
    PaintingBinding.instance.imageCache.clearLiveImages();

    setState(() {
      _cameraImage = result.bytes;
    });
  }

  void _handlePose(Pose? pose) {
    if (!mounted) return;

    setState(() {
      _detectedPose = pose;
    });
  }

  FutureOr<void> onStart() async {
    await BodyDetection.switchCamera(LensFacing.back);
    await _startCameraStream();
    await BodyDetection.enablePoseDetection();
  }

  @override
  void initState() {
    onStart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              child: Column(
                children: [
                  Container(
                    width: width,
                    height: height * 0.7,
                    child: _cameraImage != null
                        ? Image.memory(
                            _cameraImage,
                            gaplessPlayback: true,
                            fit: BoxFit.fill,
                            width: width,
                            height: height,
                          )
                        : Container(),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 24,
              right: 0,
              left: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  width: width,
                  height: height * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.amber,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Count Number",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: width * 0.07),
                      ),
                      Text(
                        pushUpCount.toInt().toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: width * 0.07,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  _stopcamre();
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.5),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back,
                      size: 32,
                      color: Colors.amber,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
