import 'package:clinic_mobile_apps/presentation/admin/doctor/blocs/get_doctor/bloc/get_doctor_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:clinic_mobile_apps/core/components/spaces.dart';
import 'package:clinic_mobile_apps/core/constants/colors.dart';
import 'package:clinic_mobile_apps/core/extensions/build_context_ext.dart';
import 'package:clinic_mobile_apps/presentation/admin/doctor/pages/add_doctor_page.dart';
import 'package:clinic_mobile_apps/presentation/admin/doctor/widgets/card_doctor_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminDoctorPage extends StatefulWidget {
  const AdminDoctorPage({
    super.key,
  });
  @override
  State<AdminDoctorPage> createState() => _AdminDoctorPageState();
}

class _AdminDoctorPageState extends State<AdminDoctorPage> {
  @override
  void initState() {
    context.read<GetDoctorBloc>().add(GetDoctorEvent.getDoctor());
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
      body: SafeArea(
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Container(
              width: context.deviceWidth,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  const Text(
                    "Kelola Doctor",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.push(const AddDoctorPage());
                    },
                    child: const Icon(
                      Icons.add,
                      size: 24.0,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SpaceHeight(14),
            BlocBuilder<GetDoctorBloc, GetDoctorState>(
              builder: (context, state) {
                return state.maybeWhen(orElse: () {
                  return Center(
                    child: Text('Tidak ada data doctor'),
                  );
                }, loading: () {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }, success: (doctors) {
                  return RefreshIndicator(
                    onRefresh: () async {
                      context.read<GetDoctorBloc>().add(
                            GetDoctorEvent.getDoctor(),
                          );
                    },
                    child: ListView.separated(
                      padding: const EdgeInsets.all(20),
                      shrinkWrap: true,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: doctors.data.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return const SpaceHeight(10);
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return CardDoctorWidget(
                          doctor: doctors.data[index],
                        );
                      },
                    ),
                  );
                });
              },
            ),
            // Padding(
            //   padding: EdgeInsets.only(
            //       top: context.deviceHeight * 0.2, left: 20, right: 20),
            //   child: const EmptyDoctorWidget(),
            // ),
          ],
        ),
      ),
    );
  }
}
