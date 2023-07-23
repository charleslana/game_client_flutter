import 'package:flutter/material.dart';

import '../components/white_button_component.dart';
import '../data/image_data.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(loginBg),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            const Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  top: 10,
                ),
                child: Text(
                  'Battle RPG',
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                    fontFamily: 'GarudaBold',
                    shadows: [
                      Shadow(
                        // bottomLeft
                        offset: Offset(-2, -2),
                      ),
                      Shadow(
                        // bottomRight
                        offset: Offset(2, -2),
                      ),
                      Shadow(
                        // topRight
                        offset: Offset(2, 2),
                      ),
                      Shadow(
                        // topLeft
                        offset: Offset(-2, 2),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: WhiteButtonComponent(
                text: 'Jogar',
                callback: () => print('hello'),
              ),
            ),
            const Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: 4,
                  left: 4,
                ),
                child: Text(
                  'CL Games',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: 4,
                  right: 4,
                ),
                child: Text(
                  'Versão: 0.0.0',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
