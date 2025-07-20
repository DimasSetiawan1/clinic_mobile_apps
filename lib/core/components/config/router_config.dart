part of '../component.dart';

class RouterConfig {
  late final GoRouter _router;

  RouterConfig() {
    _router = GoRouter(
      initialLocation: AppRouter.splashPage.path,
      routes: [
        GoRoute(
          path: AppRouter.splashPage.path,
          name: AppRouter.splashPage.name,
          builder: (context, state) => const SplashPage(),
        ),
        GoRoute(
          path: AppRouter.onboardingPage.path,
          name: AppRouter.onboardingPage.name,
          builder: (context, state) => const OnboardingPage(),
        ),
        GoRoute(
          path: AppRouter.homePatientPage.path,
          name: AppRouter.homePatientPage.name,
          builder: (context, state) {
            final index = state.uri.queryParameters['initialIndex'] ?? '0';
            return HomePage(initialIndex: int.tryParse(index) ?? 0);
          },
        ),
        GoRoute(
          path: AppRouter.detailDoctorPage.path,
          name: AppRouter.detailDoctorPage.name,
          builder: (context, state) {
            final doctor = state.uri.queryParameters['doctor'];
            return DetailDoctorPage(
              doctor: User.fromMap(jsonDecode(doctor ?? '{}')),
            );
          },
        ),
        GoRoute(
          path: AppRouter.homeDoctorPage.path,
          name: AppRouter.homeDoctorPage.name,
          builder: (context, state) => const DoctorHomePage(initialIndex: 0),
        ),
      GoRoute(
          path: AppRouter.homeAdminPage.path,
          name: AppRouter.homeAdminPage.name,
          builder: (context, state) => AdminMainPage(0),
        ),
        GoRoute(
          path: AppRouter.patientProfilePage.path,
          name: AppRouter.patientProfilePage.name,
          builder: (context, state) => const ProfilePage(),
        ),
        GoRoute(
          path: AppRouter.doctorProfilePage.path,
          name: AppRouter.doctorProfilePage.name,
          builder: (context, state) => const ProfileDoctorPage(),
        ),
        GoRoute(
          path: AppRouter.adminProfilePage.path,
          name: AppRouter.adminProfilePage.name,
          builder: (context, state) => const ProfileAdminPage(),
        ),
        GoRoute(
          path: AppRouter.privacyPolicyPage.path,
          name: AppRouter.privacyPolicyPage.name,
          builder: (context, state) => const PrivacyPolicyPage(),
        ),
        GoRoute(
          path: AppRouter.errorPage.path,
          name: AppRouter.errorPage.name,
          builder: (context, state) => const SizedBox(),
        ),
        GoRoute(
          path: AppRouter.chatListPage.path,
          name: AppRouter.chatListPage.name,
          builder: (context, state) {
            final isDoctor =
                state.pathParameters['isDoctor']?.toLowerCase() == 'true';
            return ChatPage(isDoctor: isDoctor);
          },
        ),
        GoRoute(
          path: AppRouter.confirmationOrderPage.path,
          name: AppRouter.confirmationOrderPage.name,
          builder: (context, state) {
            final doctor = state.uri.queryParameters['doctor'];
            return ConfirmationOrderPages(
              doctor: User.fromMap(jsonDecode(doctor ?? '{}')),
              isTelemedis:
                  state.uri.queryParameters['isTelemedis']?.toLowerCase() ==
                  'true',
            );
          },
        ),
        GoRoute(
          path: AppRouter.paymentWebviewPage.path,
          name: AppRouter.paymentWebviewPage.name,
          builder: (context, state) {
            final url = state.uri.queryParameters['invoice'] ?? '';
            final orderId = state.uri.queryParameters['orderId'] ?? "0";
            return PaymentWebview(
              invoiceUrl: url,
              orderId: int.tryParse(orderId)!,
            );
          },
        ),
        GoRoute(
          path: AppRouter.videoCallPage.path,
          name: AppRouter.videoCallPage.name,
          builder: (_, state) {
            final channelName = state.uri.queryParameters['channelName'] ?? '';
            final token = state.uri.queryParameters['token'] ?? '';
            final id = state.uri.queryParameters['id'] ?? '0';
            return VideoCallPage(
              channelName: channelName,
              token: token,
              id: int.parse(id),
            );
          },
        ),
        GoRoute(
          path: AppRouter.historyPatientPage.path,
          name: AppRouter.historyPatientPage.name,
          builder: (context, state) => const HistoryPage(),
        ),
        GoRoute(
          path: AppRouter.roomChatPage.path,
          name: AppRouter.roomChatPage.name,
          builder: (context, state) {
            final chatRoomId = state.uri.queryParameters['chatRoomId'] ?? '';
            final doctorName = state.uri.queryParameters['doctorName'] ?? '';
            final isDoctor = state.uri.queryParameters['isDoctor'] ?? '';
            final patientName = state.uri.queryParameters['patientName'] ?? '';
            final receiverId = state.uri.queryParameters['receiverId'] ?? '';
            final senderId = state.uri.queryParameters['senderId'] ?? '';

            return RoomChatPage(
              chatRoomId: chatRoomId,
              doctorName: doctorName,
              isDoctor: isDoctor.toLowerCase() == 'true',
              patientName: patientName,
              receiverId: int.tryParse(receiverId) ?? 0,
              senderId: int.tryParse(senderId) ?? 0,
            );
          },
        ),
      ],
      refreshListenable: StreamToListenable([CheckAuthCubit().stream]),
      redirect: (context, state) {
        final isSignedIn = context.read<CheckAuthCubit>().state;
        final userRole = AuthLocalDatasource().getRoleUser();
        final pathList = AppRoute().convertToList();
        if (isSignedIn == AuthState.authenticated &&
            pathList.contains(state.matchedLocation)) {
          return null;
        }

        if (isSignedIn != AuthState.authenticated) {
          return AppRouter.onboardingPage.path;
        }
        if (isSignedIn == AuthState.authenticated) {
          switch (userRole) {
            case UserRole.admin:
              return AppRouter.homeAdminPage.path;
            case UserRole.doctor:
              return AppRouter.homeDoctorPage.path;
            case UserRole.patient:
              return AppRouter.homePatientPage.path;
          }
        }
        return AppRouter.onboardingPage.path;
      },
    );
  }

  GoRouter get router => _router;
}
