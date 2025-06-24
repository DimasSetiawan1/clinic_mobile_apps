import 'dart:developer';

import 'package:clinic_mobile_apps/core/constants/global_variable.dart';
import 'package:clinic_mobile_apps/core/extensions/string_ext.dart';
import 'package:clinic_mobile_apps/data/datasources/auth_local_datasource.dart';
import 'package:clinic_mobile_apps/presentation/admin/home/blocs/get_history/get_history_order_bloc.dart';
import 'package:clinic_mobile_apps/presentation/admin/home/blocs/get_summary/get_summary_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:clinic_mobile_apps/core/assets/assets.gen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:clinic_mobile_apps/core/components/widgets/spaces.dart';
import 'package:clinic_mobile_apps/core/constants/colors.dart';
import 'package:clinic_mobile_apps/core/extensions/build_context_ext.dart';
import 'package:clinic_mobile_apps/presentation/doctor/history/widgets/card_doctor_history.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  void initState() {
    context.read<GetSummaryBloc>().add(GetSummaryEvent.summaryFetched());
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
    return RefreshIndicator(
      onRefresh: () async {
        context.read<GetSummaryBloc>().add(GetSummaryEvent.summaryFetched());
        context.read<GetHistoryOrderBloc>().add(
          GetHistoryOrderEvent.getHistoryOrders(),
        );
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 120,
                  width: context.deviceWidth,
                  padding: const EdgeInsets.all(20.0),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppColors.secondary, Color(0xff1469F0)],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            Assets.images.logoHorizontal.path,
                            width: 104.0,
                            height: 22.0,
                            fit: BoxFit.cover,
                          ),
                          BlocBuilder<GetSummaryBloc, GetSummaryState>(
                            builder: (context, state) {
                              return state.maybeWhen(
                                orElse: () {
                                  return Image.asset(
                                    Assets.images.klinik.path,
                                    width: 40.0,
                                    height: 40.0,
                                    fit: BoxFit.fill,
                                  );
                                },
                                loading: () {
                                  return CircularProgressIndicator();
                                },
                                success: (data) {
                                  return Container(
                                    width: 40.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          "${dotenv.env['BASE_URL']}/storage/${data.data.clinicImage}",
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SpaceHeight(136),
                BlocBuilder<GetHistoryOrderBloc, GetHistoryOrderState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () {
                        return Center(
                          child: Text(
                            "Belum ada riwayat terdaftar",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: AppColors.grey,
                            ),
                          ),
                        );
                      },
                      loading: () {
                        return Center(child: CircularProgressIndicator());
                      },
                      success: (orders) {
                        if (orders.data.isEmpty) {
                          return Center(
                            child: Text(
                              "Belum ada riwayat Pembelian",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: AppColors.grey,
                              ),
                            ),
                          );
                        } else {
                          return ListView.separated(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: orders.data.length,
                            separatorBuilder: (
                              BuildContext context,
                              int index,
                            ) {
                              return const SpaceHeight(12);
                            },
                            itemBuilder: (BuildContext context, int index) {
                              return CardDoctorHistory(
                                orders: orders.data[index],
                              );
                            },
                          );
                        }
                      },
                    );
                  },
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 80.0, left: 20.0, right: 20.0),
              width: context.deviceWidth,
              height: 153,
              padding: const EdgeInsets.all(14.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  colors: [AppColors.secondary, Color(0xff1469F0)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocBuilder<GetSummaryBloc, GetSummaryState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () => const SizedBox.shrink(),
                        loading:
                            () => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Klinik Sehat prima",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.white,
                                  ),
                                ),
                                Text(
                                  'Loading...',
                                  style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.white,
                                  ),
                                ),
                              ],
                            ),
                        success:
                            (summary) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  summary.data.clinicName,
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.white,
                                  ),
                                ),
                                Text(
                                  "Income : ${summary.data.totalIncome.toString().currencyFormatRpV2}",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.white,
                                  ),
                                ),
                              ],
                            ),
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total Pasien",
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400,
                              color: AppColors.white,
                            ),
                          ),
                          BlocBuilder<GetSummaryBloc, GetSummaryState>(
                            builder: (context, state) {
                              return state.maybeWhen(
                                orElse: () {
                                  return SizedBox.shrink();
                                },
                                success: (summary) {
                                  return Text(
                                    "${summary.data.totalPatient}",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.white,
                                    ),
                                  );
                                },
                                loading: () {
                                  return Text(
                                    'Loading...',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.white,
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total Dokter",
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400,
                              color: AppColors.white,
                            ),
                          ),
                          BlocBuilder<GetSummaryBloc, GetSummaryState>(
                            builder: (context, state) {
                              return state.maybeWhen(
                                orElse: () {
                                  return SizedBox.shrink();
                                },
                                success: (summary) {
                                  return Text(
                                    "${summary.data.totalDoctor}",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.white,
                                    ),
                                  );
                                },
                                loading: () {
                                  return Text(
                                    'Loading...',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.white,
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ],
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
