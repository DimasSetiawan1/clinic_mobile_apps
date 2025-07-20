import 'dart:developer';

import 'package:clinic_mobile_apps/core/components/widgets/custom_avatar.dart';
import 'package:clinic_mobile_apps/core/route/app_route.dart';
import 'package:clinic_mobile_apps/data/datasources/auth_local_datasource.dart';
import 'package:clinic_mobile_apps/data/models/response/login_response_model.dart';
import 'package:clinic_mobile_apps/presentation/patient/chat/blocs/get_all_message_patient/get_all_message_patient_bloc.dart';
import 'package:clinic_mobile_apps/presentation/patient/chat/pages/room_chat_page.dart';
import 'package:clinic_mobile_apps/presentation/patient/telemedis/widgets/telemedis_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:clinic_mobile_apps/core/assets/assets.gen.dart';
import 'package:clinic_mobile_apps/core/components/widgets/spaces.dart';
import 'package:clinic_mobile_apps/core/constants/colors.dart';
import 'package:clinic_mobile_apps/core/extensions/build_context_ext.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ChatPage extends StatefulWidget {
  final bool? isDoctor;
  const ChatPage({super.key, required this.isDoctor});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  UserModel? _user;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _user = AuthLocalDatasource().getUserData()?.data?.user;
    context.read<GetAllMessagePatientBloc>().add(
      GetAllMessagePatientEvent.watchListMessage(_user!.id!, _user!.role!),
    );
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xff1469F0),
        statusBarBrightness: Brightness.dark,
      ),
    );
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 120,
                width: context.deviceWidth,
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.secondary, Color(0xff1469F0)],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          Assets.images.logoHorizontal.path,
                          width: 104.0,
                          height: 22.0,
                          fit: BoxFit.cover,
                        ),
                        CustomAvatar(
                          imageUrl: _user?.image ?? '',
                          width: 48.0,
                          height: 48.0,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SpaceHeight(20),
              // FilterTelemedisStatus(),
              const SpaceHeight(20),
              BlocBuilder<GetAllMessagePatientBloc, GetAllMessagePatientState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () => const SizedBox.shrink(),
                    loading:
                        () => const Center(child: CircularProgressIndicator()),
                    loaded: (messages) {
                      if (messages.isEmpty) {
                        return const Center(
                          child: Text(
                            "Tidak ada pesan",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey,
                            ),
                          ),
                        );
                      }
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: messages.length,
                        controller: _scrollController,
                        itemBuilder: (context, index) {
                          final message = messages[index];
                          final role =
                              widget.isDoctor!
                                  ? message.doctorImage
                                  : message.patientImage;
                          return ListTile(
                            leading: CustomAvatar(
                              imageUrl:
                                  role.isNotEmpty
                                      ? message.doctorImage
                                      : message.patientImage,
                              width: 48.0,
                              height: 48.0,
                            ),
                            title: Text(
                              role.isNotEmpty
                                  ? message.patientImage
                                  : message.doctorName,
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            subtitle: Text(
                              message.lastMessage!.isEmpty
                                  ? 'Mulai percakapan'
                                  : message.lastMessage!,
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            trailing: Text(
                              message.lastMessageTime != null
                                  ? message.lastMessageTime
                                      .toString()
                                      .split(' ')[1]
                                      .substring(0, 5)
                                  : message.createdAt
                                      .toString()
                                      .split(' ')[1]
                                      .substring(0, 5),

                              style: const TextStyle(
                                fontSize: 12.0,
                                color: Colors.grey,
                              ),
                            ),
                            onTap: () {
                              GoRouter.of(context).pushNamed(
                                AppRouter.roomChatPage.name,
                                queryParameters: {
                                  'chatRoomId': message.id.toString(),
                                  'doctorName': message.doctorName,
                                  'isDoctor': widget.isDoctor.toString(),
                                  'patientName': message.patientName,
                                  'receiverId':
                                      widget.isDoctor!
                                          ? message.participants.patientId
                                              .toString()
                                          : message.participants.doctorId
                                              .toString(),
                                  'senderId': _user?.id.toString() ?? '0',
                                },
                              );
                            },
                          );
                        },
                      );
                    },
                    error: (error) {
                      return Center(child: Text(error));
                    },
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
