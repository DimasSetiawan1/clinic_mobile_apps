import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:clinic_mobile_apps/data/datasources/xendit_handle_callback_datasource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'xendit_callback_event.dart';
part 'xendit_callback_state.dart';
part 'xendit_callback_bloc.freezed.dart';

class XenditCallbackBloc
    extends Bloc<XenditCallbackEvent, XenditCallbackState> {
  final XenditHandleCallbackDatasource _callbackDatasource;
  XenditCallbackBloc(this._callbackDatasource) : super(_Initial()) {
    on<_HandleCallback>((event, emit) async {
      await _callbackDatasource.handleCallback(
          orderId: event.externalId, status: event.status);
    });
  }
}
