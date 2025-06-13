import 'package:clinic_mobile_apps/core/assets/assets.gen.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Widget showImageNetworkProfileUser({
  required String imageUrl,
  double? width,
  double? height,
}) {
  if (imageUrl.contains('doctor-')) {
    return Image.asset(
      Assets.images.doctor1.path,
      width: width ?? 87.0,
      height: height ?? 87.0,
      fit: BoxFit.cover,
    );
  }
  return (imageUrl.contains("http")
      ? Image.network(
        imageUrl,
        errorBuilder: (context, error, stackTrace) {
          return Image.asset(
            Assets.images.doctor1.path,
            width: width ?? 87.0,
            height: height ?? 87.0,
            fit: BoxFit.cover,
          );
        },
        width: width ?? 87.0,
        height: height ?? 87.0,
        fit: BoxFit.cover,
      )
      : Image.network(
        "${dotenv.env['BASE_URL']!}/$imageUrl",
        errorBuilder: (context, error, stackTrace) {
          return Image.asset(
            Assets.images.doctor1.path,
            width: width ?? 87.0,
            height: height ?? 87.0,
            fit: BoxFit.cover,
          );
        },
        width: width ?? 87.0,
        height: height ?? 87.0,
        fit: BoxFit.cover,
      ));
}
