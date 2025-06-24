part of 'component.dart';

class ClinicApp extends StatelessWidget {
  ClinicApp({super.key});

  final _routerConfig = RouterConfig().router;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.primary,
        statusBarBrightness: Brightness.dark,
      ),
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => StackNavigationCubit()),
        BlocProvider(
          create: (context) => LoadDoctorActiveBloc(DoctorRemoteDatasource()),
        ),
        BlocProvider(create: (context) => CheckAuthCubit()),
        BlocProvider(
          create: (context) => LoginGoogleBloc(AuthRemoteDatasource()),
        ),
        BlocProvider(create: (context) => GetSummaryBloc(SummaryClinic())),
        BlocProvider(
          create: (context) => GetHistoryOrderBloc(OrderHistoryDatasource()),
        ),
        BlocProvider(
          create: (context) => GetCallRoomsBloc(TelemedisDatasource()),
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
      child: MaterialApp.router(
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
        routeInformationProvider: _routerConfig.routeInformationProvider,
        routeInformationParser: _routerConfig.routeInformationParser,
        routerDelegate: _routerConfig.routerDelegate,
      ),
    );
  }
}
