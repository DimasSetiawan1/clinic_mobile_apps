import 'package:clinic_mobile_apps/core/components/widgets/custom_avatar.dart';
import 'package:clinic_mobile_apps/core/extensions/string_ext.dart';
import 'package:clinic_mobile_apps/data/models/response/orders_response_model.dart';
import 'package:flutter/material.dart';
import 'package:clinic_mobile_apps/core/components/widgets/spaces.dart';
import 'package:clinic_mobile_apps/core/constants/colors.dart';
import 'package:clinic_mobile_apps/core/extensions/build_context_ext.dart';
import 'package:intl/intl.dart';

class CardHistory extends StatelessWidget {
  final HistoryOrders orders;
  final bool isHistoryDoctor;
  const CardHistory({
    super.key,
    required this.orders,
    this.isHistoryDoctor = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Container(
        width: context.deviceWidth,
        padding: const EdgeInsets.all(20.0),
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
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child:
                      isHistoryDoctor
                          ? CustomAvatar(
                            imageUrl: orders.patient.image,
                          )
                          : CustomAvatar(
                            imageUrl: orders.doctor.image,
                          ),
                ),
                const SpaceWidth(20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment:
                        isHistoryDoctor
                            ? MainAxisAlignment.spaceBetween
                            : MainAxisAlignment.start,
                    children: [
                      Text(
                        isHistoryDoctor == true
                            ? orders.patient.name
                            : orders.doctor.name,
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        orders.service.toLowerCase().contains("chat")
                            ? 'Chat Premium'
                            : orders.service,
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),

                      isHistoryDoctor
                          ? const SpaceHeight(20)
                          : const SpaceHeight(8),
                      Text(
                        DateFormat(
                          "EEEE, dd MM yyyy - hh:mm a",
                          "id_ID",
                        ).format(DateTime.parse(orders.createdAt)),
                        style: TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      const SpaceHeight(8),
                      isHistoryDoctor
                          ? const SizedBox()
                          : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  const Text(
                                    "Total Bayar",
                                    style: TextStyle(
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                  Text(
                                    orders.price.toString().currencyFormatRpV2,
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff677294),
                                    ),
                                  ),
                                ],
                              ),

                              switch (orders.status) {
                                "PAID" => StatusOrderWigdet(
                                  width: 60,
                                  textColor: Color(0xff219653),
                                  backgroundColor: Color(
                                    0xff219653,
                                  ).withOpacity(0.15),
                                  status: orders.status,
                                ),
                                "PENDING" => StatusOrderWigdet(
                                  width: 80,
                                  textColor: Color(0xffF2994A),
                                  backgroundColor: Color(
                                    0xffF2994A,
                                  ).withOpacity(0.15),
                                  status: orders.status,
                                ),
                                "EXPIRED" => StatusOrderWigdet(
                                  width: 80,
                                  textColor: Color(0xffEB5757),
                                  backgroundColor: Color(
                                    0xffEB5757,
                                  ).withOpacity(0.15),
                                  status: orders.status,
                                ),
                                _ => Container(),
                              },
                            ],
                          ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class StatusOrderWigdet extends StatelessWidget {
  const StatusOrderWigdet({
    super.key,
    required this.status,
    required this.width,
    required this.backgroundColor,
    required this.textColor,
  });

  final String status;
  final double width;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 8,
            width: 8,
            decoration: BoxDecoration(color: textColor, shape: BoxShape.circle),
          ),
          Text(
            status,
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
