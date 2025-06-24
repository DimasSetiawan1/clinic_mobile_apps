import 'dart:developer';

import 'package:clinic_mobile_apps/core/enums/user_role.dart';
import 'package:clinic_mobile_apps/core/route/app_route.dart';
import 'package:clinic_mobile_apps/data/datasources/auth_local_datasource.dart';
import 'package:clinic_mobile_apps/data/datasources/auth_remote_datasource.dart';
import 'package:clinic_mobile_apps/data/models/response/login_response_model.dart';
import 'package:clinic_mobile_apps/presentation/auth/blocs/bloc_login_google/login_google_bloc.dart';
import 'package:clinic_mobile_apps/presentation/auth/cubits/check_auth_cubit.dart';
import 'package:clinic_mobile_apps/presentation/patient/home/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:clinic_mobile_apps/core/assets/assets.gen.dart';
import 'package:clinic_mobile_apps/core/components/widgets/buttons.dart';
import 'package:clinic_mobile_apps/core/components/widgets/spaces.dart';
import 'package:clinic_mobile_apps/core/constants/colors.dart';
import 'package:clinic_mobile_apps/core/extensions/build_context_ext.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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
                decoration: const BoxDecoration(color: AppColors.primary),
                child: Column(
                  children: [
                    const SpaceHeight(24),
                    Image.asset(Assets.images.logo.path, height: 75, width: 66),
                    const SizedBox(height: 24),
                    Image.asset(Assets.images.onboardingDoctor.path),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  width: context.deviceWidth,
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16),
                      topLeft: Radius.circular(16),
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
                      const SpaceHeight(36),
                      BlocConsumer<LoginGoogleBloc, LoginGoogleState>(
                        listener: (context, state) {
                          state.maybeWhen(
                            orElse: () {},
                            authenticated: () async {
                              final data = AuthLocalDatasource().getRoleUser();
                              final isPatientOrNewUser =
                                  AuthLocalDatasource().isNewUser();
                              await AuthRemoteDatasource().updateOneSignalToken(
                                OneSignal.User.pushSubscription.id!,
                              );
                              switch (data) {
                                case UserRole.admin:
                                  if (context.mounted) {
                                    context.goNamed(
                                      AppRouter.homeAdminPage.name,
                                    );
                                  }
                                  return;
                                case UserRole.doctor:
                                  if (context.mounted) {
                                    context.goNamed(
                                      AppRouter.homeDoctorPage.name,
                                    );
                                  }
                                  return;
                                default:
                                  if (isPatientOrNewUser) {
                                    if (context.mounted) {
                                      context.goNamed(
                                        AppRouter.privacyPolicyPage.name,
                                      );
                                    }
                                  } else if (!isPatientOrNewUser &&
                                      data == UserRole.patient) {
                                    if (context.mounted) {
                                      log(
                                        'User is patient, navigating to home page',
                                      );
                                      context.goNamed(
                                        AppRouter.homePatientPage.name,
                                        queryParameters: {"initialIndex": "0"},
                                      );
                                    }
                                  }
                                  return;
                              }
                            },
                            error: (errorMessage) {
                              return ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(errorMessage)),
                              );
                            },
                          );
                        },
                        builder: (context, state) {
                          return state.maybeWhen(
                            orElse: () {
                              return Button.filled(
                                height: 48,
                                onPressed: () async {
                                  await AuthRemoteDatasource().signInWithGoogle(
                                    context,
                                  );
                                  if (context.mounted) {
                                    context.read<CheckAuthCubit>().checkAuth();
                                  }
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
                            loading:
                                () => Center(
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

                      const SpaceHeight(30),
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
