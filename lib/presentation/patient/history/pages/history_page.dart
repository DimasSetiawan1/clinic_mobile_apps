import 'dart:developer';

import 'package:clinic_mobile_apps/core/assets/assets.gen.dart';
import 'package:clinic_mobile_apps/presentation/admin/home/blocs/get_history/get_history_order_bloc.dart';
import 'package:clinic_mobile_apps/presentation/doctor/history/widgets/card_doctor_history.dart';
import 'package:clinic_mobile_apps/presentation/patient/chat/pages/chat_with_doctor_page.dart';
import 'package:clinic_mobile_apps/presentation/patient/chat/pages/payment_url_page.dart';
import 'package:clinic_mobile_apps/presentation/patient/history/widgets/card_history.dart';
import 'package:clinic_mobile_apps/presentation/patient/telemedis/pages/telemedis_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:clinic_mobile_apps/core/components/spaces.dart';
import 'package:clinic_mobile_apps/core/constants/colors.dart';
import 'package:clinic_mobile_apps/core/extensions/build_context_ext.dart';
import 'package:clinic_mobile_apps/presentation/patient/history/widgets/empty_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  void initState() {
    context
        .read<GetHistoryOrderBloc>()
        .add(GetHistoryOrderEvent.getHistoryOrders());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xff1469F0),
      statusBarBrightness: Brightness.dark,
    ));
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      appBar: AppBar(
        title: Text('History Orders',
            style: TextStyle(color: Colors.white, fontSize: 20)),
        backgroundColor: AppColors.primary,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: BlocBuilder<GetHistoryOrderBloc, GetHistoryOrderState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () {
                return ListView(children: [
                  Container(
                    width: context.deviceWidth,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.secondary,
                          Color(0xff1469F0),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "Chat Premium",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                  const SpaceHeight(14),
                  Center(
                    child: Text(
                      "Error fetching history orders",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: AppColors.gray,
                      ),
                    ),
                  )
                ]);
              },
              loading: () => Center(
                child: CircularProgressIndicator(),
              ),
              success: (data) {
                if (data.data.isEmpty) {
                  return Center(
                    child: RefreshIndicator(
                      onRefresh: () async {
                        context
                            .read<GetHistoryOrderBloc>()
                            .add(GetHistoryOrderEvent.getHistoryOrders());
                      },
                      child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Assets.images.emptyHistory.svg(
                              width: context.deviceWidth * 0.5,
                              height: context.deviceHeight * 0.3,
                              fit: BoxFit.cover,
                            ),
                            const SpaceHeight(16),
                            Text(
                              "No history orders found",
                              style: TextStyle(
                                fontSize: 16.0,
                                // color: AppColors.gray,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
                return RefreshIndicator(
                  onRefresh: () async {
                    context
                        .read<GetHistoryOrderBloc>()
                        .add(GetHistoryOrderEvent.getHistoryOrders());
                  },
                  child: ListView.builder(
                    itemCount: data.data.length,
                    itemBuilder: (context, index) {
                      final dataOrder = data.data[index];
                      return InkWell(
                        onTap: () {
                          if (dataOrder.status.toLowerCase() == "pending") {
                            context.push(
                              PaymentWebview(
                                invoiceUrl: dataOrder.paymentUrl,
                                orderId: dataOrder.id,
                              ),
                            );
                          }
                          if (dataOrder.chatRooms.status == "open" &&
                              dataOrder.service.toLowerCase() == "chat") {
                            context.push(ChatWithDoctorPage(
                              name: dataOrder.doctor.name,
                              chatRoom: dataOrder.chatRooms,
                            ));
                          }
                        },
                        child: CardHistory(
                          orders: dataOrder,
                        ),
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
