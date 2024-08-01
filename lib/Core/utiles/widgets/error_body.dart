import 'package:flutter/material.dart';

class ErrorBody extends StatelessWidget {
  const ErrorBody({Key? key, required this.errorMessage}) : super(key: key);

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage,
      ),
    );
  }
}
