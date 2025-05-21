import 'dart:developer';

import 'package:clinic_mobile_apps/data/datasources/auth_local_datasource.dart';
import 'package:clinic_mobile_apps/data/datasources/auth_remote_datasource.dart';
import 'package:clinic_mobile_apps/data/models/response/login_response_model.dart';
import 'package:clinic_mobile_apps/presentation/auth/blocs/bloc_login_google/login_google_bloc.dart';
import 'package:clinic_mobile_apps/presentation/auth/blocs/check_auth/check_auth_bloc.dart';
import 'package:clinic_mobile_apps/presentation/home/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:clinic_mobile_apps/core/assets/assets.gen.dart';
import 'package:clinic_mobile_apps/core/components/buttons.dart';
import 'package:clinic_mobile_apps/core/components/spaces.dart';
import 'package:clinic_mobile_apps/core/constants/colors.dart';
import 'package:clinic_mobile_apps/core/extensions/build_context_ext.dart';
import 'package:clinic_mobile_apps/presentation/admin/home/pages/admin_main_page.dart';
import 'package:clinic_mobile_apps/presentation/auth/pages/privacy_policy_page.dart';
import 'package:clinic_mobile_apps/presentation/doctor/home/pages/doctor_home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
// import 'package:onesignal_flutter/onesignal_flutter.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: context.deviceHeight,
                width: context.deviceWidth,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                ),
                child: Column(
                  children: [
                    const SpaceHeight(24),
                    Image.asset(
                      Assets.images.logo.path,
                      height: 75,
                      width: 66,
                    ),
                    const SizedBox(height: 24),
                    Image.asset(
                      Assets.images.onboardingDoctor.path,
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  width: context.deviceWidth,
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(
                        16,
                      ),
                      topLeft: Radius.circular(
                        16,
                      ),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SpaceHeight(16),
                      const Text(
                        "Jaga Kesehatan, Dimana Saja",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      const SpaceHeight(6),
                      const Text(
                        "Konsultasikan kesehatan Anda kapan saja dan di mana saja bersama profesional terpercaya",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          color: AppColors.grey,
                        ),
                      ),
                      const SpaceHeight(
                        36,
                      ),
                      BlocConsumer<LoginGoogleBloc, LoginGoogleState>(
                        listener: (context, state) {
                          state.maybeWhen(
                              orElse: () {},
                              success: (LoginResponseModel data) async {
                                await AuthLocalDatasource().savedUserData(data);
                                if (data.data!.user!.role == 'admin') {
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) {
                                    context.pushReplacement(AdminMainPage(0));
                                  });
                                  return;
                                } else if (data.data!.user!.role == 'doctor') {
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) {
                                    context.pushReplacement(
                                        const DoctorHomePage());
                                  });
                                  return;
                                }

                                if (data.data!.isNew!) {
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) {
                                    context
                                        .pushReplacement(PrivacyPolicyPage());
                                  });
                                  return;
                                } else {
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) {
                                    context.pushReplacement(HomePage());
                                  });
                                }
                                await AuthRemoteDatasource()
                                    .updateOneSignalToken(
                                        OneSignal.User.pushSubscription.id!);
                              },
                              error: (errorMessage) {
                                return ScaffoldMessenger.of(context)
                                    .showSnackBar(
                                  SnackBar(
                                    content: Text(errorMessage),
                                  ),
                                );
                              });
                        },
                        builder: (context, state) {
                          return state.maybeWhen(
                            orElse: () {
                              return Button.filled(
                                height: 48,
                                onPressed: () async {
                                  await AuthRemoteDatasource()
                                      .signInWithGoogle(context);
                                },
                                label: 'Masuk dengan Google',
                                icon: Image.asset(
                                  Assets.images.google.path,
                                  height: 24,
                                  width: 24,
                                  color: Colors.white,
                                ),
                                fontSize: 14.0,
                              );
                            },
                            loading: () => Center(
                              child: CircularProgressIndicator(
                                color: Colors.purple,
                              ),
                            ),
                          );
                        },
                      ),
                      const SpaceHeight(26),
                      // Button.filled(
                      //     onPressed: () {
                      //       context.push(const DoctorHomePage());
                      //     },
                      //     label: 'Doctor Page'),
                      const SpaceHeight(26),
                      // Button.filled(
                      //     onPressed: () {
                      //       context.push(const AdminMainPage());
                      //     },
                      //     label: 'Admin Page'),
                      const SpaceHeight(26),
                      const Text(
                        "Powerred by",
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                          color: AppColors.grey,
                        ),
                      ),
                      const SpaceHeight(6),
                      Image.asset(
                        Assets.images.jf4.path,
                        // height: 60,
                        width: 80,
                        color: AppColors.primary,
                      ),
                      const SpaceHeight(24),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
