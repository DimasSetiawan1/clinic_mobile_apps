import 'dart:developer';

import 'package:clinic_mobile_apps/core/constants/global_variable.dart';
import 'package:clinic_mobile_apps/data/datasources/auth_local_datasource.dart';
import 'package:clinic_mobile_apps/data/models/response/login_response_model.dart';
import 'package:clinic_mobile_apps/presentation/patient/blocs/load_doctor_active/load_doctor_active_bloc.dart';
import 'package:clinic_mobile_apps/presentation/patient/chat/pages/detail_doctor_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:clinic_mobile_apps/core/assets/assets.gen.dart';
import 'package:clinic_mobile_apps/core/components/spaces.dart';
import 'package:clinic_mobile_apps/core/constants/colors.dart';
import 'package:clinic_mobile_apps/core/extensions/build_context_ext.dart';
import 'package:clinic_mobile_apps/presentation/patient/telemedis/widgets/card_doctor_telemedis.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DoctorsPage extends StatefulWidget {
  const DoctorsPage({super.key});

  @override
  State<DoctorsPage> createState() => _DoctorsPageState();
}

class _DoctorsPageState extends State<DoctorsPage> {
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
                const SpaceHeight(70),
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
                              return InkWell(
                                onTap: () {
                                  context.push(
                                    DetailDoctorPage(
                                      doctor: doctors[index],
                                      isTelemedis: true,
                                    ),
                                  );
                                },
                                child: CardDoctorTelemedis(
                                  user: doctors[index],
                                ),
                              );
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
            Container(
              margin: const EdgeInsets.only(top: 80.0, left: 20.0, right: 20.0),
              width: context.deviceWidth,
              padding: const EdgeInsets.all(14.0),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x19000000),
                    blurRadius: 20,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const SpaceHeight(8),
                  Container(
                    width: context.deviceWidth,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffF5F5F5),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.search, color: Color(0xff8C8C8C)),
                        const SpaceWidth(16),
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Cari dokter atau spesialis',
                              hintStyle: TextStyle(
                                color: Color(0xff8C8C8C),
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SpaceHeight(10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          height: 26,
                          width: 72,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.primary.withOpacity(0.2),
                          ),
                          child: const Center(
                            child: Text(
                              'Semua',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        ),
                        const SpaceWidth(16),
                        menu('Anak'),
                        const SpaceWidth(16),
                        menu('Kandungan'),
                        const SpaceWidth(16),
                        menu('Psikiater'),
                      ],
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

  Widget menu(String title) {
    return Container(
      height: 26,
      width: 72,
      padding: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xffEFF2F1),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Color(0xffA7A6A5),
          ),
        ),
      ),
    );
  }
}
