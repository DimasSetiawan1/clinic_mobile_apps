enum AppRouter {
  splashPage,
  errorPage,
  chatWithDoctorPage,
  detailDoctorPage,
  confirmationOrderPage,
  paymentWebviewPage,
  tosPage,
  privacyPolicyPage,
  onboardingPage,
  homePatientPage,
  homeDoctorPage,
  homeAdminPage,
  patientProfilePage,
  doctorProfilePage,
  adminProfilePage,
  doctorListPage,
  chatListPage,
  chatPage,
  telemedicineListPage,
  telemedicinePage,
  historyPatientPage,
  historyDoctorPage,
  roomChatPage,
  historyAdminPage,
}

class AppRoute {
  List<String> convertToList() {
    return AppRouter.values
        .where((router) => router != AppRouter.splashPage)
        .map((router) => router.path)
        .toList();
  }
}

extension AppRouterExtension on AppRouter {
  static const _paths = {
    AppRouter.splashPage: '/',
    AppRouter.errorPage: '/error',
    AppRouter.tosPage: '/terms-of-service',
    AppRouter.privacyPolicyPage: '/privacy-policy',
    AppRouter.onboardingPage: '/onboarding',
    AppRouter.homePatientPage: '/home/patient',
    AppRouter.detailDoctorPage: '/doctor/detail',
    AppRouter.homeDoctorPage: '/home/doctor',
    AppRouter.homeAdminPage: '/home/admin',
    AppRouter.patientProfilePage: '/profile/patient',
    AppRouter.doctorProfilePage: '/profile/doctor',
    AppRouter.adminProfilePage: '/profile/admin',
    AppRouter.doctorListPage: '/doctor/list',
    AppRouter.chatListPage: '/chat/list',
    AppRouter.chatPage: '/chat',
    AppRouter.telemedicineListPage: '/telemedicine/list',
    AppRouter.telemedicinePage: '/telemedicine',
    AppRouter.historyPatientPage: '/history/patient',
    AppRouter.historyDoctorPage: '/history/doctor',
    AppRouter.historyAdminPage: '/history/admin',
    AppRouter.confirmationOrderPage: '/order/confirmation',
    AppRouter.paymentWebviewPage: '/payment/webview',
    AppRouter.roomChatPage: '/chat/room',
    AppRouter.chatWithDoctorPage: '/chat/doctor',
    
  };
  
  String get path => _paths[this] ?? '';
}
