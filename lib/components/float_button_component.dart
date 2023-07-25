import 'package:flutter/material.dart';

import '../data/image_data.dart';
import '../utils/theme_util.dart';

class FloatButtonComponent extends StatelessWidget {
  const FloatButtonComponent({
    Key? key,
    required this.image,
    required this.text,
    this.callback,
  }) : super(key: key);

  final String image;
  final String text;
  final VoidCallback? callback;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: callback,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: size.height * 0.15,
              height: size.height * 0.15,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(floatButton),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: FractionallySizedBox(
                  widthFactor: 0.7,
                  heightFactor: 0.7,
                  child: Image.asset(
                    image,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 2),
            SizedBox(
              width: size.height * 0.15,
              height: 16,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.bottomCenter,
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: shadows,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
