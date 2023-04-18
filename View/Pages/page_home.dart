import 'package:flutter/material.dart';
import '/View/Widgets/pragy_avater.dart';
import '/ViewModel/size_vm.dart';

import '../../ViewModel/routes_vm.dart';
import '../Scaffold/my_scaffold_all.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldAll(
      appBarLeading: null,
      bottomBar: false,
      body: Center(
        child: Hero(
          tag: "pyragy",
          child: AvaterPyragy(
            onTap: () {
              Navigator.pushNamed(context, Rout.record);
            },
            width: MySize.arentir * 0.5,
          ),
        ),
      ),
    );
  }
}
