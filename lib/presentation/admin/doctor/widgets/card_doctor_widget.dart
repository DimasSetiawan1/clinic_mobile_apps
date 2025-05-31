// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clinic_mobile_apps/core/constants/global_variable.dart';
import 'package:clinic_mobile_apps/core/extensions/time_ext.dart';
import 'package:clinic_mobile_apps/data/models/response/doctor_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:clinic_mobile_apps/core/assets/assets.gen.dart';
import 'package:clinic_mobile_apps/core/components/spaces.dart';
import 'package:clinic_mobile_apps/core/constants/colors.dart';
import 'package:clinic_mobile_apps/core/extensions/build_context_ext.dart';
import 'package:clinic_mobile_apps/presentation/admin/doctor/pages/edit_doctor_page.dart';

class CardDoctorWidget extends StatelessWidget {
  final User doctor;
  const CardDoctorWidget({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.deviceWidth,
      padding: const EdgeInsets.all(16.0),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child:
                    doctor.image != null
                        ? doctor.image.toString().contains('https://')
                            ? Image.network(
                              '${doctor.image}',
                              width: 87.0,
                              height: 87.0,
                              fit: BoxFit.cover,
                            )
                            : Image.network(
                              '${dotenv.env['BASE_URL']}${doctor.image}',
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                  Assets.images.doctor1.path,
                                  width: 87.0,
                                  height: 87.0,
                                );
                              },
                              width: 87.0,
                              height: 87.0,
                              fit: BoxFit.cover,
                            )
                        : Image.asset(
                          Assets.images.doctor1.path,
                          width: 87.0,
                          height: 87.0,
                        ),
              ),
              const SpaceWidth(20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctor.name,
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SpaceHeight(4),
                    Text(
                      doctor.specialist?.name ?? '-',
                      style: const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                    const SpaceHeight(10),
                    _itemRow(
                      Assets.icons.hospitalPrimary.path,
                      doctor.clinic?.name ?? "?",
                    ),
                    const SpaceHeight(8),
                    _itemRow(
                      Assets.icons.clockPrimary.path,
                      "${doctor.startTime} - ${doctor.endTime}",
                    ),
                  ],
                ),
              ),
              const SpaceWidth(8),
              GestureDetector(
                onTap: () {
                  context.push(EditDoctorPage(doctor: doctor));
                },
                child: const Text(
                  "Edit",
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
          const SpaceHeight(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Status Dokter",
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              doctor.status == "active"
                  ? Container(
                    width: 80,
                    height: 34,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: const Color(0xffE0E8F2).withOpacity(0.6),
                      ),
                      gradient: const LinearGradient(
                        colors: [AppColors.secondary, Color(0xff1469F0)],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "Aktif",
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  )
                  : Container(
                    width: 80,
                    height: 34,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: const Color(0xffE0E8F2).withOpacity(0.6),
                      ),
                      color: AppColors.white,
                    ),
                    child: const Center(
                      child: Text(
                        "Non Aktif",
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _itemRow(String icon, String value) {
    return Row(
      children: [
        Image.asset(icon, width: 18.0, height: 18.0, fit: BoxFit.cover),
        const SpaceWidth(13),
        Expanded(
          child: Text(
            value,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(
              fontSize: 10.0,
              fontWeight: FontWeight.w400,
              color: Colors.black,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
