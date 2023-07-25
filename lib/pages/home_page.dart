import 'package:flutter/material.dart';

import '../components/float_button_component.dart';
import '../components/select_button_component.dart';
import '../data/image_data.dart';
import '../routes/app_routes.dart';
import '../utils/utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Material(
      child: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(homeBg),
              fit: BoxFit.cover,
              alignment: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Stack(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          FloatButtonComponent(
                            image: icon1,
                            text: 'Menu',
                          ),
                          FloatButtonComponent(
                            image: icon2,
                            text: 'Menu Muito Grande',
                          ),
                          FloatButtonComponent(
                            image: icon1,
                            text: 'Menu',
                          ),
                        ],
                      ),
                      SizedBox(width: 20),
                      Column(
                        children: [
                          FloatButtonComponent(
                            image: icon1,
                            text: 'Menu muito',
                          ),
                          FloatButtonComponent(
                            image: icon1,
                            text: 'Menu',
                          ),
                          FloatButtonComponent(
                            image: icon1,
                            text: 'Menu',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Column(
                    children: [
                      const FloatButtonComponent(
                        image: icon1,
                        text: 'Menu muito',
                      ),
                      const FloatButtonComponent(
                        image: icon1,
                        text: 'Menu',
                      ),
                      FloatButtonComponent(
                        image: icon1,
                        text: 'Menu',
                        callback: () => pushReplacementNamed(
                          context,
                          loginRoute,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 5,
                  right: size.width * 0.1,
                  child: const SelectButtonComponent(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
