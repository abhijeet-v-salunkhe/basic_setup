import 'package:flutter/material.dart';
import 'package:basic_setup/core/common/colour_constants/colour_constants.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Dialog")),
      color: whiteColor,
    );
  }
}
