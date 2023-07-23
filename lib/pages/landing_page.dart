import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/image_data.dart';
import '../providers/loading_provider.dart';
import '../routes/app_routes.dart';
import '../utils/utils.dart';

class LandingPage extends ConsumerStatefulWidget {
  const LandingPage({super.key});

  @override
  ConsumerState<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends ConsumerState<LandingPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showLoading();
    });
  }

  void showLoading() {
    loading(context);
    ref.read(loadingProvider.notifier).value = 'Conectando no servidor';
    Future.delayed(const Duration(milliseconds: 2000), () {
      pop(context);
      pushReplacementNamed(context, loginRoute);
      // showNewVersionDialog(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(landingBg),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
