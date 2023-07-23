import 'package:flutter/material.dart';

import '../data/image_data.dart';
import '../routes/app_routes.dart';
import '../utils/utils.dart';

class DataLoadingPage extends StatefulWidget {
  const DataLoadingPage({super.key});

  @override
  State<DataLoadingPage> createState() => _DataLoadingPageState();
}

class _DataLoadingPageState extends State<DataLoadingPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadImages();
  }

  void loadImages() {
    Future.wait([
      precacheImage(const AssetImage(landingBg), context),
      precacheImage(const AssetImage(loadingAnimated), context),
      precacheImage(const AssetImage(loginBg), context),
      precacheImage(const AssetImage(whiteButton), context),
    ]).then((_) => pushReplacementNamed(context, landingRoute));
  }

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
