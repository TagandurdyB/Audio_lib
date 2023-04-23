// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
import '/View/Widgets/pragy_avater.dart';
import '/ViewModel/size_vm.dart';
import '../Widgets/my_container.dart';
import '/View/Scaffold/my_scaffold_all.dart';

class RecorderPage extends StatefulWidget {
  const RecorderPage({super.key});

  @override
  State<RecorderPage> createState() => _RecorderPageState();
}

class _RecorderPageState extends State<RecorderPage> {
  final recorder = FlutterSoundRecorder();
  late Timer timer;
  double pagingVal = 0;
  bool isReady = false;
  final double arentir = MySize.arentir;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 900), (timer) {
      if (timerView == "01:00") {
        stop();
        Navigator.pop(context);
      }
      setState(() {
        if (pagingVal == 0) {
          pagingVal = 0.08;
        } else {
          pagingVal = 0;
        }
      });
    });
    initRecorder();
  }

  Future initRecorder() async {
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw "I Need Mic";
    }
    
    await recorder.openRecorder();
    isReady = true;
    record();
    recorder.setSubscriptionDuration(const Duration(seconds: 1));
  }

  Future record() async {
    if (!isReady) return;
    await recorder.startRecorder(
        toFile: "pyragy_sound.wav", codec: Codec.pcm16WAV);
  }

  Future stop() async {
    if (!isReady) return;
    final path = await recorder.stopRecorder();
    final audioFile = File(path!);

    print("AudioFile:=$audioFile");
  }

  @override
  void dispose() {
    timer.cancel();
    recorder.closeRecorder();
    super.dispose();
  }

  String timerView = "";

  @override
  Widget build(BuildContext context) {
    return ScaffoldAll(
        enableAppBar: false,
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(height: MySize.width * 0.2),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: MySize.width,
                child: Hero(
                    tag: "pyragy",
                    child: Stack(
                      children: [
                        buildVolume(
                          duration: const Duration(milliseconds: 200),
                          child: buildVolume(
                            duration: const Duration(milliseconds: 400),
                            child: buildVolume(
                              duration: const Duration(milliseconds: 600),
                              child: const AvaterPyragy(
                                width: 200,
                                height: 200,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
              const Expanded(child: SizedBox()),
              StreamBuilder(
                  stream: recorder.onProgress,
                  builder: (context, snapshot) {
                    final duration = snapshot.hasData
                        ? snapshot.data!.duration
                        : Duration.zero;

                    String twoDigit(int n) => n.toString().padLeft(2, "0");
                    String min = twoDigit(duration.inMinutes.remainder(60));
                    String sec = twoDigit(duration.inSeconds.remainder(60));
                    timerView = "$min:$sec";
                    return Text(
                      timerView,
                      style: TextStyle(
                          fontSize: arentir * 0.1, color: Colors.white),
                    );
                  }),
              buildBtn("Iber", Icons.send, () async {
                await stop();
                Navigator.pop(context);
              }),
              // buildBtn("Ýatda Sakla", Icons.save),
              buildBtn("Ýatyr", Icons.cancel, () async {
                await stop();
                Navigator.pop(context);
              }),
              SizedBox(height: arentir * 0.1),
            ],
          ),
        ));
  }

  Widget buildVolume({
    child,
    Duration duration = const Duration(milliseconds: 300),
  }) {
    return AnimatedContainer(
      duration: duration,
      //shape: MySize.arentir * 0.5,
      decoration: BoxDecoration(
        color: Colors.blue,
        gradient: RadialGradient(
          colors: [Colors.transparent, Colors.brown[200]!],
          stops: const [0.9, 1],
        ),
        borderRadius: BorderRadius.circular(MySize.arentir * 0.5),
      ),
      padding: EdgeInsets.all(MySize.arentir * pagingVal),
      child: child,
    );
  }

  Widget buildBtn(String text, IconData iconD, Function func) {
    return MyContainer(
      onTap: func,
      margin: EdgeInsets.all(arentir * 0.02),
      shape: arentir * 0.1,
      borderWidth: 2,
      colors: [Colors.brown, Colors.brown[800]!],
      width: arentir * 0.6,
      height: arentir * 0.15,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Icon(
            iconD,
            size: arentir * 0.08,
            color: Colors.white,
          ),
          SizedBox(width: arentir * 0.04),
          Text(
            text,
            style: TextStyle(
                color: Colors.white,
                fontSize: arentir * 0.07,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
