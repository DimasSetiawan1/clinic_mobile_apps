import 'dart:convert';

import 'package:clinic_mobile_apps/core/components/widgets/custom_avatar.dart';
import 'package:clinic_mobile_apps/core/extensions/string_ext.dart';
import 'package:clinic_mobile_apps/core/route/app_route.dart';
import 'package:clinic_mobile_apps/data/models/response/doctor_response_model.dart';
import 'package:flutter/material.dart';
import 'package:clinic_mobile_apps/core/assets/assets.gen.dart';
import 'package:clinic_mobile_apps/core/components/widgets/buttons.dart';
import 'package:clinic_mobile_apps/core/components/widgets/spaces.dart';
import 'package:clinic_mobile_apps/core/constants/colors.dart';
import 'package:clinic_mobile_apps/core/extensions/build_context_ext.dart';
import 'package:go_router/go_router.dart';

class DetailDoctorPage extends StatelessWidget {
  final User doctor;
  const DetailDoctorPage({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          doctor.name,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        height: 150,
        // color: AppColors.,
        width: context.deviceWidth,
        decoration: const BoxDecoration(color: AppColors.white),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            2,
            (index) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hanya Dengan",
                  style: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff677294),
                  ),
                ),

                Text(
                  index == 0
                      ? doctor.chatFee.toString().currencyFormatRpV2
                      : doctor.telemedicineFee.toString().currencyFormatRpV2,
                  style: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff677294),
                  ),
                ),
                const SpaceHeight(16),

                Expanded(
                  flex: 1,
                  child: Button.filled(
                    width: context.deviceWidth * 0.4,
                    height: 40,
                    borderRadius: 10,
                    onPressed: () {
                      GoRouter.of(context).pushNamed(
                        AppRouter.confirmationOrderPage.name,
                        queryParameters: {
                          'doctor': jsonEncode(doctor.toMap()),
                          'isTelemedis': index != 0 ? 'true' : 'false',
                        },
                      );
                    },
                    label: index == 0 ? 'Chat Sekarang' : 'Telemedis',
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ),
        ),

        //   ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                color: AppColors.primary,
                child: CustomAvatar(
                  imageUrl: doctor.image,
                  width: context.deviceWidth,
                  height: context.deviceHeight * 0.5,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: context.deviceHeight * 0.45),
                padding: const EdgeInsets.all(24.0),
                width: context.deviceWidth,
                decoration: const BoxDecoration(
                  color: AppColors.lightBackground,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                    topLeft: Radius.circular(8),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              doctor.name,
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              doctor.specialist?.name.toString() ?? "Umum",
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                            ),
                            const SpaceHeight(10),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Color(0xffF2C94C),
                                  size: 24.0,
                                ),
                                const SpaceWidth(8),
                                const Text(
                                  "4.6 review (100 ulasan)",
                                  style: TextStyle(
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                                const SpaceWidth(16),
                                Image.asset(
                                  Assets.icons.personHistory.path,
                                  width: 18,
                                  height: 18,
                                ),
                                const SpaceWidth(8),
                                Text(
                                  "8 tahun",
                                  style: TextStyle(
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        // SizedBox(
                        //   width: 24.0,
                        //   height: 24.0,
                        //   child: SvgPicture.asset(
                        //     Assets.icons.chat.path,
                        //     colorFilter: const ColorFilter.mode(
                        //       AppColors.primary,
                        //       BlendMode.srcIn,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    const SpaceHeight(24),
                    const Text(
                      "Penghargaan dan Sertifikasi",
                      style: TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const SpaceHeight(8),
                    item(doctor.certification ?? "-"),
                    const SpaceHeight(24),
                    const Text(
                      "Tempat Praktik",
                      style: TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const SpaceHeight(8),
                    Text(
                      doctor.clinic?.name ?? "Clinic",
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget item(String certification) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: CircleAvatar(
            radius: 4.0,
            backgroundColor: AppColors.grey.withOpacity(0.4),
          ),
        ),
        const SpaceWidth(8),
        Expanded(
          child: Text(
            "$certification ",
            style: const TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              color: AppColors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
