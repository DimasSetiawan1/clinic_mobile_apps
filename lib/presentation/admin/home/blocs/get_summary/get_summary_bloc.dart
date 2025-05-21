import 'package:bloc/bloc.dart';
import 'package:clinic_mobile_apps/data/datasources/summary_clinic.dart';
import 'package:clinic_mobile_apps/data/models/response/summary_response_model.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_summary_event.dart';
part 'get_summary_state.dart';
part 'get_summary_bloc.freezed.dart';

class GetSummaryBloc extends Bloc<GetSummaryEvent, GetSummaryState> {
  final SummaryClinic _summaryClinic;
  GetSummaryBloc(this._summaryClinic) : super(_Initial()) {
    on<_SummaryFetched>((event, emit) async {
      emit(_Loading());
      final request = await _summaryClinic.getSummary();
      request.fold((l) => emit(_Error(l)), (r) => emit(_Success(r)));
    });
  }
}
