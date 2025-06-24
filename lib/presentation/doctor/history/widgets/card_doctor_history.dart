// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clinic_mobile_apps/core/extensions/string_ext.dart';
import 'package:clinic_mobile_apps/data/models/response/orders_response_model.dart';
import 'package:flutter/material.dart';

import 'package:clinic_mobile_apps/core/assets/assets.gen.dart';
import 'package:clinic_mobile_apps/core/components/widgets/spaces.dart';
import 'package:clinic_mobile_apps/core/constants/colors.dart';
import 'package:clinic_mobile_apps/core/extensions/build_context_ext.dart';
import 'package:intl/intl.dart';

class CardDoctorHistory extends StatelessWidget {
  final HistoryOrders orders;

  const CardDoctorHistory({
    super.key,
    required this.orders,
  });

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'paid':
        return Color(0xff64c88d);
      case 'waiting':
        return Colors.orange;
      case 'cancelled':
        return Colors.red;
      default:
        return Colors.black;
    }
  } //

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shadowColor: Colors.white,
        child: Container(
          width: context.deviceWidth,
          padding: const EdgeInsets.all(14.0),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(16.0),
            ),
            border: Border.all(
              color: const Color(0xffE0E8F2).withOpacity(
                0.6,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 52.0,
                      height: 52.0,
                      // alignment: Alignment.topCenter,
                      padding: const EdgeInsets.all(14.0),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            AppColors.secondary,
                            Color(0xff1469F0),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Image.asset(
                        Assets.icons.emptyWallet.path,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SpaceWidth(12),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  orders.service,
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  orders.price.toString().currencyFormatRpV2,
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            const SpaceHeight(4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "ID transaksi",
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff26273A)
                                          .withOpacity(0.6)),
                                ),
                                Text(
                                  DateFormat('d MMM yyyy', 'id_ID')
                                      .format(DateTime.parse(orders.createdAt)),
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff26273A)
                                          .withOpacity(0.6)),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  orders.id.toString(),
                                  style: const TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                ),
                                Text(
                                  DateFormat("hh:mm a", "id_ID")
                                      .format(DateTime.parse(orders.createdAt)),
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff26273A)
                                          .withOpacity(0.6)),
                                ),
                              ],
                            ),
                            const SpaceHeight(8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  width: 50,
                                  height: 20,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Color(0xffcdfeea),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    orders.status,
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600,
                                      color: _getStatusColor(orders.status),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
