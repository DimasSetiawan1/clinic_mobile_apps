import 'package:clinic_mobile_apps/core/constants/colors.dart';
import 'package:clinic_mobile_apps/presentation/patient/telemedis/blocs/get_call_rooms/get_call_rooms_bloc.dart';
import 'package:clinic_mobile_apps/presentation/patient/telemedis/cubits/telemedis_status_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TelemedisStatus extends StatelessWidget {
  const TelemedisStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(TelemedisStatusState.values.length, (index) {
          return BlocBuilder<TelemedisStatusCubit, TelemedisStatusState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GestureDetector(
                  onTap: () {
                    context.read<TelemedisStatusCubit>().setFilterStatus(
                      TelemedisStatusState.values[index],
                    );

                    context.read<GetCallRoomsBloc>().add(
                      GetCallRoomsEvent.getCallRooms(
                        TelemedisStatusState.values[index],
                      ),
                    );
                  },
                  child: Container(
                    height: 26,
                    width: 80,
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color:
                          state == TelemedisStatusState.values[index]
                              ? AppColors.primary
                              : const Color(0xffEFF2F1),
                    ),
                    child: Center(
                      child: Text(
                        TelemedisStatusState.values[index].name,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color:
                              state == TelemedisStatusState.values[index]
                                  ? AppColors.white
                                  : Color(0xffA7A6A5),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
