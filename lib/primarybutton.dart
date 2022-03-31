import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PrimaryButton extends StatelessWidget {
  final String buttonText;
  PrimaryButton({required this.buttonText});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      width: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.blue.withOpacity(0.20)),
      child: Center(
        child: Text(
          buttonText,
        ),
      ),
    );
    throw UnimplementedError();
  }
}
