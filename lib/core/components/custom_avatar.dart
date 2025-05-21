import 'dart:math';

import 'package:clinic_mobile_apps/core/assets/assets.gen.dart';
import 'package:flutter/widgets.dart';

class CustomAvatar extends StatelessWidget {
  final String? imageUrl;
  final double width;
  final double height;
  final BoxFit fit;
  final List<String>? placeholderAssets;

  const CustomAvatar({
    super.key,
    this.imageUrl,
    this.width = 87.0,
    this.height = 87.0,
    this.fit = BoxFit.cover,
    this.placeholderAssets,
  });

  @override
  Widget build(BuildContext context) {
    final isNetworkImage = imageUrl != null &&
        (imageUrl!.startsWith('http') || imageUrl!.startsWith('https'));
    final placeholders = placeholderAssets ?? _defaultPlaceholders();

    return isNetworkImage
        ? _buildNetworkImage()
        : _buildAssetImage(placeholders);
  }

  List<String> _defaultPlaceholders() {
    return [
      Assets.images.doctor1.path,
      Assets.images.doctor2.path,
      Assets.images.doctor3.path,
      Assets.images.doctor4.path,
      Assets.images.doctor5.path,
    ];
  }

  Widget _buildNetworkImage() {
    return Image.network(
      imageUrl!,
      width: width,
      height: height,
      fit: fit,
    );
  }

  Widget _buildAssetImage(List<String> assets) {
    final randomIndex = Random().nextInt(assets.length);
    return Image.asset(
      assets[randomIndex],
      width: width,
      height: height,
      fit: fit,
    );
  }
}
