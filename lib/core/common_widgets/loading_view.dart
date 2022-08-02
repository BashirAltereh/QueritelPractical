import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  final Color color;

  const LoadingView({
    Key? key,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color,
      ),
    );
  }
}
