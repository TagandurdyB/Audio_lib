import 'package:flutter/material.dart';

import '../Scaffold/my_scaffold_all.dart';
import '../Screens/second_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldAll(
      appBarLeading: null,
      bottomBar: false,
      body: SecondScreen(),
    );
  }
}
