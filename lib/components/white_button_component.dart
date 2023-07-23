import 'package:flutter/material.dart';

import '../data/image_data.dart';

class WhiteButtonComponent extends StatelessWidget {
  const WhiteButtonComponent({
    Key? key,
    required this.text,
    this.callback,
    this.isBig = true,
  }) : super(key: key);

  final String text;
  final VoidCallback? callback;
  final bool isBig;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: callback,
        child: Container(
          width: isBig ? 210 : 124,
          height: isBig ? 90 : 53,
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(whiteButton),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                text.toUpperCase(),
                style: TextStyle(
                  fontSize: isBig ? 35 : 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
