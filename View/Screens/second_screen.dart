import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import '/View/Widgets/my_container.dart';
import '/View/Widgets/pragy_avater.dart';

import '../../ViewModel/Providers/provider_app_bar.dart';
import '../../ViewModel/size_vm.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const VolumeEffect();
  }
}

class VolumeEffect extends StatefulWidget {
  const VolumeEffect({super.key});

  @override
  State<VolumeEffect> createState() => _VolumeEffectState();
}

class _VolumeEffectState extends State<VolumeEffect> {
  final recorder = FlutterSoundRecorder();
  double? height = 600;
  bool isListening = false;

  final double arentir = MySize.arentir;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: AvaterPyragy(
        onTap: () {
          setState(() {
            if (isListening) {
              height = 600;
              isListening = false;
              ProcessAppBar(context).changeVisivle(true);
            } else if (!isListening) {
              height = MySize.width;
              isListening = true;
              ProcessAppBar(context).changeVisivle(false);
            }
          });
          //Navigator.pushNamed(context, Rout.record);
        },
        width: arentir * 0.4,
        height: arentir * 0.4,
      ),
    );
    // return Column(
    //   children: [

    //     // Text(
    //     //   "00:00",
    //     //   style: TextStyle(fontSize: arentir * 0.07),
    //     // ),
    //     // buildBtn("Iber", Icons.send, () {}),
    //     // // buildBtn("Ýatda Sakla", Icons.save),
    //     // buildBtn("Ýatyr", Icons.cancel, () {}),
    //   ],
    // );
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
                fontSize: arentir * 0.07, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
