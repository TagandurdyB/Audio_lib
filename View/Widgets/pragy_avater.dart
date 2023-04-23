import 'package:flutter/material.dart';

import '../../ViewModel/Providers/provider_theme.dart';
import 'my_container.dart';

class AvaterPyragy extends StatelessWidget {
  final Function? onTap;
  final double? width;
  final double? height;
  const AvaterPyragy({
    this.width,
    this.height,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      duration: const Duration(milliseconds: 150),
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      boxShadow: DistributorTheme(context).shadows.all,
      colors: [Colors.green, Colors.green[800]!],
      width: width,
      height: height,
      shape: 200,
      child: const ClipOval(
        child: Image(
          fit: BoxFit.cover,
          image: ExactAssetImage("assets/pyragy_img.png"),
        ),
      ),
    );
  }
}
