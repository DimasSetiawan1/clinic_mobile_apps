import 'dart:developer';

import 'package:clinic_mobile_apps/core/extensions/string_ext.dart';
import 'package:clinic_mobile_apps/data/datasources/auth_local_datasource.dart';
import 'package:clinic_mobile_apps/data/models/request/create_order_request_model.dart';
import 'package:clinic_mobile_apps/data/models/response/doctor_response_model.dart';
import 'package:clinic_mobile_apps/presentation/chat/blocs/create_order/create_order_bloc.dart';
import 'package:clinic_mobile_apps/presentation/chat/pages/payment_url_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:clinic_mobile_apps/core/components/buttons.dart';
import 'package:clinic_mobile_apps/core/components/spaces.dart';
import 'package:clinic_mobile_apps/core/constants/colors.dart';
import 'package:clinic_mobile_apps/core/extensions/build_context_ext.dart';
import 'package:clinic_mobile_apps/presentation/chat/pages/payment_page.dart';
import 'package:clinic_mobile_apps/presentation/chat/widgets/card_premium_chat.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PremiumChatPage extends StatelessWidget {
  final User doctor;
  final bool isTelemedis;
  const PremiumChatPage({
    super.key,
    required this.doctor,
    required this.isTelemedis,
  });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xff1469F0),
        statusBarBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        height: 77,
        width: context.deviceWidth,
        decoration: const BoxDecoration(color: AppColors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Biaya Konsultasi",
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary,
                  ),
                ),
                Text(
                  isTelemedis
                      ? doctor.telemedicineFee.toString().currencyFormatRpV2
                      : doctor.chatFee.toString().currencyFormatRpV2,
                  style: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff677294),
                  ),
                ),
              ],
            ),
            BlocConsumer<CreateOrderBloc, CreateOrderState>(
              listener: (context, state) {
                state.maybeWhen(
                  failure: (error) {
                    context.showSnackBar(error, Colors.red);
                  },
                  orElse: () {},
                  success: (order) {
                    context.push(
                      PaymentWebview(
                        invoiceUrl: order.data!.paymentUrl!,
                        orderId: order.data!.id!,
                      ),
                    );
                  },
                );
              },
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () {
                    return Button.filled(
                      width: 130,
                      height: 40,
                      borderRadius: 10,
                      onPressed: () {
                        final localData = AuthLocalDatasource().getUserData();
                        final model = CreateOrderRequestModel(
                          patientId: localData!.data!.user!.id!,
                          doctorId: doctor.id,
                          service: isTelemedis ? "Telemedicine" : "Chat",
                          price:
                              isTelemedis
                                  ? doctor.telemedicineFee!
                                  : doctor.chatFee!,
                          duration: 30,
                          clinicId: doctor.clinic!.id,
                          schedule: DateTime.now(),
                        );
                        context.read<CreateOrderBloc>().add(
                          CreateOrderEvent.createOrder(model),
                        );
                      },
                      label:
                          isTelemedis
                              ? 'Order Telemedis'
                              : 'Order Chat Premium',
                      fontSize: 12.0,
                    );
                  },
                  loading: () => CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              width: context.deviceWidth,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.secondary, Color(0xff1469F0)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.white,
                    ),
                  ),
                  SpaceWidth(context.deviceWidth * 0.2),
                  Text(
                    isTelemedis ? 'Telemedicine' : 'Chat',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: CardPremiumChat(doctor: doctor),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
              width: context.deviceWidth,
              decoration: BoxDecoration(
                color: AppColors.lightYellow,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: AppColors.yellow,
                        size: 20,
                      ),
                      SpaceWidth(12),
                      Text(
                        "Ketentuan Penggunaan",
                        style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff1E293B),
                        ),
                      ),
                    ],
                  ),
                  SpaceHeight(8),
                  Text(
                    "Fasilitas ini bisa memberi diagnosa awal dalam kondisi pengguna. Chat di aplikasi tidak menggantikan interaksi fisik Dokter. Dokter akan meresepkan obat sesuai aturan berdasarkan informasi dari pengguna.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffB2B2B2),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
