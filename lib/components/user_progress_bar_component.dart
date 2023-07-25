import 'package:flutter/material.dart';

class UserProgressBarComponent extends StatelessWidget {
  const UserProgressBarComponent({required this.progress, super.key});

  final double progress;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.02,
      decoration: BoxDecoration(
        color: Colors.grey[850],
      ),
      child: Stack(
        children: [
          Container(
            width: progress * size.width,
            height: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
