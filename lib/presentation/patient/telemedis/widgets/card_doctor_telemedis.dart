// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:math';

import 'package:clinic_mobile_apps/core/components/widgets/custom_avatar.dart';
import 'package:clinic_mobile_apps/core/route/app_route.dart';
import 'package:clinic_mobile_apps/data/models/response/telemedis_response_model.dart';
import 'package:flutter/material.dart';

import 'package:clinic_mobile_apps/core/components/widgets/spaces.dart';
import 'package:clinic_mobile_apps/core/constants/colors.dart';
import 'package:clinic_mobile_apps/core/extensions/build_context_ext.dart';
import 'package:go_router/go_router.dart';

class CardDoctorTelemedis extends StatelessWidget {
  final TelemedisResponseModel user;
  final bool isDoctor;
  const CardDoctorTelemedis({
    super.key,
    required this.user,
    required this.isDoctor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        switch (user.status.toLowerCase()) {
          case 'waiting':
            GoRouter.of(context).pushNamed(
              AppRouter.videoCallPage.name,
              queryParameters: {
                'channelName': user.callChannel,
                'token': user.callToken,
                'id': user.id.toString(),
              },
            );
            break;
          case 'expired':
            break;
          case 'finished':
            showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                  title: const Text('Telemedicine Finished'),
                  content: const Text(
                    'Your telemedicine session has finished. You can view the details in your history.',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('OK'),
                    ),
                  ],
                );
              },
            );
            break;
          case 'ongoing':
            showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                  title: const Text('Telemedicine Expired'),
                  content: const Text(
                    'Your telemedicine session has expired. Please contact support for further assistance.',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('OK'),
                    ),
                  ],
                );
              },
            );
            break;
          default:
        }
      },
      child: Container(
        width: context.deviceWidth,
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          boxShadow: [
            BoxShadow(
              color: Color(0x19000000),
              blurRadius: 20,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: CustomAvatar(
                    imageUrl:
                        isDoctor
                            ? user.patient.image ?? ''
                            : user.doctor.image ?? '',
                    width: 87.0,
                    height: 87.0,
                    fit: BoxFit.cover,
                  ),
                ),
                const SpaceWidth(20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Telemedis",
                        style: const TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const SpaceHeight(4),
                      Text(
                        // user.status,
                        isDoctor ? user.patient.name : user.doctor.name,
                        style: const TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                      const SpaceHeight(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: context.deviceWidth * 0.2,
                            height: 25,
                            decoration: BoxDecoration(
                              color:
                                  user.status.toLowerCase() == 'waiting'
                                      ? const Color(0xffF2C94C)
                                      : user.status.toLowerCase() == 'ongoing'
                                      ? const Color(0xff27AE60)
                                      : const Color(0xffEB5757),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                user.status,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // const SpaceHeight(16),
          ],
        ),
      ),
    );
  }
}
