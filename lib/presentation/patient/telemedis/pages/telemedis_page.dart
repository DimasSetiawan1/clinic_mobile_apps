import 'dart:developer';

import 'package:clinic_mobile_apps/core/constants/global_variable.dart';
import 'package:clinic_mobile_apps/data/datasources/auth_local_datasource.dart';
import 'package:clinic_mobile_apps/data/models/response/login_response_model.dart';
import 'package:clinic_mobile_apps/presentation/patient/doctors/blocs/load_doctor_active/load_doctor_active_bloc.dart';
import 'package:clinic_mobile_apps/presentation/patient/telemedis/widgets/filter_telemedis_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:clinic_mobile_apps/core/assets/assets.gen.dart';
import 'package:clinic_mobile_apps/core/components/spaces.dart';
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
                          _user?.image != null
                              ? Image.network(
                                _user!.image!.contains("http")
                                    ? _user!.image!
                                    : dotenv.env['BASE_URL']! + _user!.image!,
                                width: 40.0,
                                height: 40.0,
                                fit: BoxFit.cover,
                              )
                              : Image.asset(
                                Assets.images.doctorCircle.path,
                                width: 40.0,
                                height: 40.0,
                                fit: BoxFit.cover,
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
                          return const Center(child: Text('Data not found'));
                        }
                        return ListView.separated(
                          padding: const EdgeInsets.all(20),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: doctors.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return const SpaceHeight(10);
                          },
                          itemBuilder: (BuildContext context, int index) {
                            if (doctors[index].status == 'active' &&
                                doctors[index].role == 'doctor') {
                              return CardDoctorTelemedis(user: doctors[index]);
                            } else {
                              return Container();
                            }
                          },
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
    );
  }
}
