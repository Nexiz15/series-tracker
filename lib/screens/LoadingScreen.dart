import 'package:flutter/material.dart';
import '../config/constants.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constants.primaryColor,
        body: Center(
          child: LoadingAnimationWidget.threeArchedCircle(
            color: Constants.secondaryColor,
            size: 100.0,
          ),
        )
    );
  }
}
