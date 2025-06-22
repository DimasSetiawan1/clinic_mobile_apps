import 'dart:developer';

import 'package:clinic_mobile_apps/core/services/firebase_services.dart';
import 'package:clinic_mobile_apps/core/utils/shared_preferences_utils.dart';
import 'package:clinic_mobile_apps/data/datasources/auth_local_datasource.dart';
import 'package:clinic_mobile_apps/data/datasources/auth_remote_datasource.dart';
import 'package:clinic_mobile_apps/data/datasources/create_order_datasource.dart';
import 'package:clinic_mobile_apps/data/datasources/doctor_remote_datasource.dart';
import 'package:clinic_mobile_apps/data/datasources/order_history_datasource.dart';
import 'package:clinic_mobile_apps/data/datasources/specalist_datasource.dart';
import 'package:clinic_mobile_apps/data/datasources/summary_clinic.dart';
import 'package:clinic_mobile_apps/data/models/response/room_chat_response_model.dart';
import 'package:clinic_mobile_apps/presentation/admin/doctor/blocs/add_doctor/add_doctor_bloc.dart';
import 'package:clinic_mobile_apps/presentation/admin/doctor/blocs/edit_doctor/edit_doctor_bloc.dart';
import 'package:clinic_mobile_apps/presentation/admin/doctor/blocs/get_doctor/bloc/get_doctor_bloc.dart';
import 'package:clinic_mobile_apps/presentation/admin/doctor/blocs/get_specialist_doctor/specalist_doctor_bloc.dart';
import 'package:clinic_mobile_apps/presentation/admin/home/blocs/get_history/get_history_order_bloc.dart';
import 'package:clinic_mobile_apps/presentation/admin/home/blocs/get_summary/get_summary_bloc.dart';
import 'package:clinic_mobile_apps/presentation/admin/home/pages/admin_main_page.dart';
import 'package:clinic_mobile_apps/presentation/auth/blocs/bloc_login_google/login_google_bloc.dart';
import 'package:clinic_mobile_apps/presentation/auth/blocs/check_auth/check_auth_bloc.dart';
import 'package:clinic_mobile_apps/presentation/doctor/blocs/get_order_doctor/get_order_doctor_bloc.dart';
import 'package:clinic_mobile_apps/presentation/doctor/chat/bloc/get_all_message_doctor_bloc.dart';
import 'package:clinic_mobile_apps/presentation/doctor/home/pages/doctor_home_page.dart';
import 'package:clinic_mobile_apps/presentation/patient/chat/blocs/chat_room/chat_room_bloc.dart';
import 'package:clinic_mobile_apps/presentation/patient/chat/blocs/get_all_message_patient/get_all_message_patient_bloc.dart';
import 'package:clinic_mobile_apps/presentation/patient/chat/cubits/validation_message_cubit.dart';
import 'package:clinic_mobile_apps/presentation/patient/doctors/blocs/load_doctor_active/load_doctor_active_bloc.dart';
import 'package:clinic_mobile_apps/presentation/patient/doctors/blocs/create_order/create_order_bloc.dart';
import 'package:clinic_mobile_apps/presentation/patient/home/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:clinic_mobile_apps/core/constants/colors.dart';
import 'package:clinic_mobile_apps/presentation/auth/pages/onboarding_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SharedPreferencesUtils.init();
  await initializeDateFormatting('id_ID', null);
  await dotenv.load(fileName: ".env");
  OneSignal.initialize(dotenv.env['ONESIGNAL_APP_ID'] ?? '');
  OneSignal.Notifications.requestPermission(true);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final localData = AuthLocalDatasource();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.primary,
        statusBarBrightness: Brightness.dark,
      ),
    );
    final userRole = localData.getRoleUser();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoadDoctorActiveBloc(DoctorRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => LoginGoogleBloc(AuthRemoteDatasource()),
        ),
        BlocProvider(create: (context) => GetSummaryBloc(SummaryClinic())),
        BlocProvider(
          create: (context) => GetHistoryOrderBloc(OrderHistoryDatasource()),
        ),
        BlocProvider(
          create: (context) => GetDoctorBloc(DoctorRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => SpecalistDoctorBloc(SpecalistDatasource()),
        ),
        BlocProvider(
          create: (context) => AddDoctorBloc(DoctorRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => EditDoctorBloc(DoctorRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => CreateOrderBloc(CreateOrderDatasource()),
        ),
        BlocProvider(
          create: (context) => GetHistoryOrderBloc(OrderHistoryDatasource()),
        ),
        BlocProvider(
          create: (context) => CheckAuthBloc(AuthRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => GetOrderDoctorBloc(DoctorRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => GetAllMessagePatientBloc(FirebaseServices()),
        ),
        BlocProvider(
          create: (context) => GetAllMessageDoctorBloc(FirebaseServices()),
        ),
        BlocProvider(create: (context) => ChatRoomBloc(FirebaseServices())),
        BlocProvider(create: (context) => ValidationMessageCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          useMaterial3: true,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          appBarTheme: AppBarTheme(
            color: AppColors.white,
            elevation: 0,
            titleTextStyle: GoogleFonts.poppins(
              color: AppColors.primary,
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
            iconTheme: const IconThemeData(color: AppColors.primary),
          ),
        ),
        home: BlocBuilder<CheckAuthBloc, CheckAuthState>(
          builder: (context, state) {
            return state.when(
              initial: () => const OnboardingPage(),
              authenticated: () {
                switch (userRole.value) {
                  case 'admin':
                    return AdminMainPage(0);
                  case 'doctor':
                    return const DoctorHomePage();
                  case 'patient':
                    return const HomePage();
                  default:
                    return const OnboardingPage();
                }
              },
              unauthenticated: () => const OnboardingPage(),
            );
          },
        ),
      ),
    );
  }
}
