import 'package:clinic_mobile_apps/core/utils/shared_preferences_utils.dart';
import 'package:clinic_mobile_apps/firebase_options.dart';
import 'package:clinic_mobile_apps/core/components/component.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SharedPreferencesUtils.init();
  await initializeDateFormatting('id_ID', null);
  await dotenv.load(fileName: ".env");
  OneSignal.initialize(dotenv.env['ONESIGNAL_APP_ID'] ?? '');
  OneSignal.Notifications.requestPermission(true);

  runApp(ClinicApp());
}

