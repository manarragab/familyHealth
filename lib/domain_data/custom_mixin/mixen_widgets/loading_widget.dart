import 'package:abg/data/const/export.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../res/configuration/color.dart';
import '../../../res/loading/loading.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomLoadingAnimation().spinKitChasingDots;
  }
}
