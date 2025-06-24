import 'package:clinic_mobile_apps/core/assets/assets.gen.dart';
import 'package:clinic_mobile_apps/core/constants/global_variable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CustomAvatar extends StatelessWidget {
  final String? imageUrl;
  final double? radius;
  final double width;
  final double height;
  final BoxFit fit;

  const CustomAvatar({
    super.key,
    this.imageUrl,
    this.radius = 0,
    this.width = 87.0,
    this.height = 87.0,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null || imageUrl!.contains('doctor-')) {
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius:
              radius != 0 ? BorderRadius.circular(radius!) : BorderRadius.zero,
          image: DecorationImage(
            image: Assets.images.doctor1.provider(),
            fit: fit,
          ),
        ),
      );
    }
    final isNetworkImage =
        (imageUrl!.startsWith('http') || imageUrl!.startsWith('https'));
    final placeholders = Assets.images.doctor1.path;
    if (imageUrl!.contains('images')) {
      return _buildNetworkImage(
        imageUrl: "${dotenv.env['BASE_URL']!}/$imageUrl",
        width: width,
        height: height,
        radius: radius,
        fit: fit,
      );
    } else {
      return isNetworkImage
          ? _buildNetworkImage(
            imageUrl: imageUrl!,
            width: width,
            radius: radius,
            height: height,
            fit: fit,
          )
          : Image.asset(placeholders, width: width, height: height, fit: fit);
    }
  }
}

/// Build an [Image] widget from a network image URL.
///
/// [imageUrl] is the URL of the image. [width], [height], and [fit] are
/// forwarded to the [Image] constructor.
Widget _buildNetworkImage({
  required String imageUrl,
  double? width,
  double? radius,
  double? height,
  BoxFit fit = BoxFit.cover,
}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      borderRadius:
          radius != 0 ? BorderRadius.circular(radius!) : BorderRadius.zero,
      image: DecorationImage(image: NetworkImage(imageUrl), fit: fit),
    ),
  );
}
