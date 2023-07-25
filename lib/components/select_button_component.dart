import 'package:flutter/material.dart';

import '../data/image_data.dart';

class SelectButtonComponent extends StatelessWidget {
  const SelectButtonComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: () => {},
        child: Container(
          width: size.height * 0.3,
          height: size.height * 0.3,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(selectButton),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: FractionallySizedBox(
              widthFactor: 0.7,
              heightFactor: 0.7,
              child: Image.asset(
                icon3,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
