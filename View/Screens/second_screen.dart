import 'package:flutter/material.dart';
import 'package:pragy/View/Widgets/my_container.dart';
import 'package:pragy/View/Widgets/pragy_avater.dart';

import '../../ViewModel/Providers/provider_app_bar.dart';
import '../../ViewModel/size_vm.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            VolumeEffect(),
          ]),
    );
  }
}

class VolumeEffect extends StatefulWidget {
  const VolumeEffect({super.key});

  @override
  State<VolumeEffect> createState() => _VolumeEffectState();
}

class _VolumeEffectState extends State<VolumeEffect> {
  double? height = 600;

  final double arentir = MySize.arentir;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyContainer(
          duration: const Duration(milliseconds: 200),
          color: Colors.transparent,
          borderColor: Colors.transparent,
          alignment: Alignment.center,
          height: height,
          child: AvaterPyragy(
            onTap: () {
              setState(() {
                if (height == MySize.width) {
                  height = 600;
                  ProcessAppBar(context).changeVisivle(true);
                } else {
                  height = MySize.width;
                  ProcessAppBar(context).changeVisivle(false);
                }
              });
              //Navigator.pushNamed(context, Rout.record);
            },
            width: arentir * 0.4,
            height: arentir * 0.4,
          ),
        ),
      ],
    );
  }
}
