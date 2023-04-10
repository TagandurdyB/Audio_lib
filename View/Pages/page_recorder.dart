import 'package:flutter/material.dart';
import 'package:pragy/View/Widgets/pragy_avater.dart';
import '/View/Scaffold/my_scaffold_all.dart';
import '/View/Widgets/my_container.dart';

class RecorderPage extends StatelessWidget {
  const RecorderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldAll(
        enableAppBar: false,
        body: MyContainer(
          color: Colors.transparent,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              AvaterPyragy(
                onTap: () => Navigator.pop(context),
                width: 200,
                height: 200,
              )
            ],
          ),
        ));
  }
}
