import 'dart:developer';

import 'package:clinic_mobile_apps/core/components/widgets/custom_avatar.dart';
import 'package:clinic_mobile_apps/core/constants/global_variable.dart';
import 'package:clinic_mobile_apps/data/datasources/auth_local_datasource.dart';
import 'package:clinic_mobile_apps/data/models/response/login_response_model.dart';
import 'package:clinic_mobile_apps/presentation/patient/doctors/blocs/load_doctor_active/load_doctor_active_bloc.dart';
import 'package:clinic_mobile_apps/presentation/patient/telemedis/widgets/filter_telemedis_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:clinic_mobile_apps/core/assets/assets.gen.dart';
import 'package:clinic_mobile_apps/core/components/widgets/spaces.dart';
import 'package:clinic_mobile_apps/core/constants/colors.dart';
import 'package:clinic_mobile_apps/core/extensions/build_context_ext.dart';
import 'package:clinic_mobile_apps/presentation/patient/telemedis/widgets/card_doctor_telemedis.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class TelemedisPage extends StatefulWidget {
  const TelemedisPage({super.key});

  @override
  State<TelemedisPage> createState() => _TelemedisPageState();
}

class _TelemedisPageState extends State<TelemedisPage> {
  UserModel? _user;
  @override
  void initState() {
    context.read<LoadDoctorActiveBloc>().add(
      LoadDoctorActiveEvent.loadDoctor(),
    );
    _user = AuthLocalDatasource().getUserData()?.data?.user;
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
        context.read<LoadDoctorActiveBloc>().add(
          LoadDoctorActiveEvent.loadDoctor(),
        );
      },
      child: SingleChildScrollView(
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
                          CustomAvatar(
                            imageUrl: _user!.image ?? '',
                            width: 40.0,
                            height: 40.0,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SpaceHeight(20),
                FilterTelemedisStatus(),
                const SpaceHeight(5),
                BlocBuilder<LoadDoctorActiveBloc, LoadDoctorActiveState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () {
                        return const Center(child: CircularProgressIndicator());
                      },
                      success: (doctors) {
                        if (doctors.isEmpty) {
                          return const Center(
                            child: Text('No doctors available'),
                          );
                        }
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: doctors.length,
                          itemBuilder: (context, index) {
                            // final doctor = doctors[index];
                            // return CardDoctorTelemedis(doctor: doctor);
                            log(doctors[index].toMap().toString());
                          },
                        );
                      },
                      failure: (message) {
                        log(message);
                        return Center(child: Text('Error: $message'));
                      },
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
