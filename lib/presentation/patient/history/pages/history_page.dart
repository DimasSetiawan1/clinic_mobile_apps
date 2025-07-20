import 'dart:developer';

import 'package:clinic_mobile_apps/core/assets/assets.gen.dart';
import 'package:clinic_mobile_apps/core/route/app_route.dart';
import 'package:clinic_mobile_apps/core/services/firebase_services.dart';
import 'package:clinic_mobile_apps/data/datasources/auth_remote_datasource.dart';
import 'package:clinic_mobile_apps/presentation/admin/home/blocs/get_history/get_history_order_bloc.dart';
import 'package:clinic_mobile_apps/presentation/patient/chat/pages/chat_with_doctor_page.dart';
import 'package:clinic_mobile_apps/presentation/patient/orders/pages/payment_url_page.dart';
import 'package:clinic_mobile_apps/presentation/patient/history/widgets/card_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:clinic_mobile_apps/core/components/widgets/spaces.dart';
import 'package:clinic_mobile_apps/core/constants/colors.dart';
import 'package:clinic_mobile_apps/core/extensions/build_context_ext.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final _firebaseServices = FirebaseServices();

  @override
  void initState() {
    context.read<GetHistoryOrderBloc>().add(
      GetHistoryOrderEvent.getHistoryOrders(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xff1469F0),
        statusBarBrightness: Brightness.dark,
      ),
    );
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: context.deviceWidth,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.secondary, Color(0xff1469F0)],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            child: const Center(
              child: Text(
                "History",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<GetHistoryOrderBloc, GetHistoryOrderState>(
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () {
                    return ListView(
                      children: [
                        Container(
                          width: context.deviceWidth,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [AppColors.secondary, Color(0xff1469F0)],
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
                        ),
                      ],
                    );
                  },
                  loading: () {
                    return FutureBuilder(
                      future: Future.delayed(const Duration(seconds: 10)),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (context.mounted) {
                            showDialog(
                              context: context,
                              builder:
                                  (context) => AlertDialog(
                                    title: const Text('Timeout'),
                                    content: const Text(
                                      'Loading is taking too long. Please refresh.',
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          context.read<GetHistoryOrderBloc>().add(
                                            GetHistoryOrderEvent.getHistoryOrders(),
                                          );
                                        },
                                        child: const Text('Refresh'),
                                      ),
                                    ],
                                  ),
                            );
                          }
                        }
                        return const Center(child: CircularProgressIndicator());
                      },
                    );
                  },
                  success: (data) {
                    if (data.data.isEmpty) {
                      return Center(
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
                      );
                    }
                    return RefreshIndicator(
                      onRefresh: () async {
                        context.read<GetHistoryOrderBloc>().add(
                          GetHistoryOrderEvent.getHistoryOrders(),
                        );
                      },
                      child: ListView.builder(
                        itemCount: data.data.length,
                        itemBuilder: (context, index) {
                          final dataOrder = data.data[index];
                          return InkWell(
                            onTap: () {
                              if (dataOrder.status.toLowerCase() == "pending") {
                                GoRouter.of(context).pushNamed(
                                  AppRouter.paymentWebviewPage.name,
                                  queryParameters: {
                                    'invoice': dataOrder.paymentUrl.toString(),
                                    'orderId': dataOrder.id.toString(),
                                  },
                                );
                              }
                              if (dataOrder.chatRooms.status == "open" &&
                                  dataOrder.service.toLowerCase() == "chat") {
                                _firebaseServices
                                    .checkDocumentExists(
                                      documentId: dataOrder.chatRooms.id,
                                    )
                                    .then((exists) {
                                      if (exists) {
                                        if (context.mounted) {
                                          GoRouter.of(context).pushNamed(
                                            AppRouter.chatWithDoctorPage.name,
                                            queryParameters: {
                                              'name': dataOrder.patient.name,
                                              'chatRoom':
                                                  dataOrder.chatRooms.id,
                                              'doctorName':
                                                  dataOrder.doctor.name,
                                            },
                                          );
                                        }
                                      } else {
                                        if (context.mounted) {
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                'Chat room not found. Please try again later.',
                                              ),
                                            ),
                                          );
                                        }
                                      }
                                    });
                              }
                            },
                            child: CardHistory(orders: dataOrder),
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
