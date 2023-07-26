import 'package:flutter/material.dart';

import '../data/image_data.dart';

class UserBarComponent extends StatelessWidget {
  const UserBarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double avatarRadius = size.height * 0.09;

    return Container(
      width: double.infinity,
      height: size.height * 0.18,
      color: Colors.grey[800],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                CircleAvatar(
                  radius: avatarRadius,
                  backgroundColor: Colors.brown,
                  backgroundImage: const AssetImage(avatar1),
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Charles',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Nível: 1',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _candy('100 / 100', size),
                  const SizedBox(width: 10),
                  _currency(gold, 0, size),
                  const SizedBox(width: 10),
                  _currency(ruby, 999, size),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _currency(String image, int value, Size size) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[700],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Image.asset(
            image,
            height: size.height * 0.3,
          ),
          const SizedBox(width: 5),
          Text(
            value.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  Widget _candy(String value, Size size) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[700],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Image.asset(
            candy,
            height: size.height * 0.3,
          ),
          const SizedBox(width: 5),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
