import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../constants/appcolors.dart';

class CustomLoader extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  final Color color;

  const CustomLoader(
      {Key? key,
      required this.child,
      required this.isLoading,
      this.color = AppColors.whiteColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
        isLoading: isLoading,
        opacity: 0.1,
        progressIndicator: SpinKitSpinningLines(
          size: 40,
          color: color,
        ),
        child: child);
  }
}
