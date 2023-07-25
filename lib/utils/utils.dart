import 'dart:io';

import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../flame/loading_game.dart';
import '../providers/loading_provider.dart';

void loading(BuildContext context) {
  showDialog<dynamic>(
    barrierDismissible: false,
    context: context,
    builder: (_) {
      return Consumer(builder: (_, ref, __) {
        final text = ref.watch(loadingProvider).value;
        return WillPopScope(
          onWillPop: () async => false,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final screenSize =
                  Size(constraints.maxWidth, constraints.maxHeight);
              return Dialog(
                elevation: 0,
                backgroundColor: Colors.transparent,
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Container(
                            alignment: Alignment.center,
                            color: Colors.transparent,
                            width: screenSize.width / 5,
                            height: screenSize.height / 5,
                            child: GameWidget<LoadingGame>(
                              game: LoadingGame(screenSize: screenSize),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        text.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      });
    },
  );
}

void pop(BuildContext context) {
  Navigator.pop(context);
}

void popUntil(BuildContext context) {
  Navigator.of(context).popUntil((route) => route.isFirst);
}

void pushNamed(BuildContext context, String route) {
  Navigator.pushNamed(context, route);
}

void pushReplacementNamed(BuildContext context, String route) {
  Navigator.pushReplacementNamed(context, route);
}

Future<void> showNewVersionDialog(BuildContext context) async {
  await showDialog<dynamic>(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Nova atualização disponível, por favor atualize o aplicativo na sua loja',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'Esta ação requer para continuar a usar o aplicativo',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                WidgetsBinding.instance.addPostFrameCallback((_) => exit(0));
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    },
  );
}
