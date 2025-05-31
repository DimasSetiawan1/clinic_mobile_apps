import 'package:clinic_mobile_apps/core/assets/assets.gen.dart';
import 'package:clinic_mobile_apps/core/constants/global_variable.dart';
import 'package:flutter/widgets.dart';

class CustomAvatar extends StatelessWidget {
  final String? imageUrl;
  final double width;
  final double height;
  final BoxFit fit;

  const CustomAvatar({
    super.key,
    this.imageUrl,
    this.width = 87.0,
    this.height = 87.0,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    final isNetworkImage = imageUrl != null &&
        (imageUrl!.startsWith('http') || imageUrl!.startsWith('https'));
    final placeholders = Assets.images.doctor1.path;

    return isNetworkImage
        ? _buildNetworkImage(imageUrl!)
        : Image.asset(
            placeholders,
            width: width,
            height: height,
            fit: fit,
          );
  }

  /// Build an [Image] widget from a network image URL.
  ///
  /// [imageUrl] is the URL of the image. [width], [height], and [fit] are
  /// forwarded to the [Image] constructor.
  Widget _buildNetworkImage(String imageUrl) {
    return Image.network(
      imageUrl,
      width: width,
      height: height,
      fit: fit,
    );
  }
}
