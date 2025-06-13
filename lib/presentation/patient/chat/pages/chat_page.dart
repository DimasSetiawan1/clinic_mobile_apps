import 'dart:developer';

import 'package:clinic_mobile_apps/core/constants/global_variable.dart';
import 'package:clinic_mobile_apps/core/utils/images_usecase.dart';
import 'package:clinic_mobile_apps/data/datasources/auth_local_datasource.dart';
import 'package:clinic_mobile_apps/data/models/response/login_response_model.dart';
import 'package:clinic_mobile_apps/presentation/doctor/chat/pages/room_chat_doctor_page.dart';
import 'package:clinic_mobile_apps/presentation/patient/chat/blocs/get_all_message_patient/get_all_message_patient_bloc.dart';
import 'package:clinic_mobile_apps/presentation/patient/chat/pages/room_chat_page.dart';
import 'package:clinic_mobile_apps/presentation/patient/doctors/blocs/load_doctor_active/load_doctor_active_bloc.dart';
import 'package:clinic_mobile_apps/presentation/patient/telemedis/widgets/filter_telemedis_status.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:clinic_mobile_apps/core/assets/assets.gen.dart';
import 'package:clinic_mobile_apps/core/components/spaces.dart';
import 'package:clinic_mobile_apps/core/constants/colors.dart';
import 'package:clinic_mobile_apps/core/extensions/build_context_ext.dart';
import 'package:clinic_mobile_apps/presentation/patient/telemedis/widgets/card_doctor_telemedis.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';

class ChatPage extends StatefulWidget {
  final bool? isDoctor;
  const ChatPage({super.key, required this.isDoctor});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  UserModel? _user;
  @override
  void initState() {
    _user = AuthLocalDatasource().getUserData()?.data?.user;
    context.read<GetAllMessagePatientBloc>().add(
      GetAllMessagePatientEvent.getAllMessage(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xff1469F0),
        statusBarBrightness: Brightness.dark,
      ),
    );
    return RefreshIndicator(
      onRefresh: () async {
        context.read<GetAllMessagePatientBloc>().add(
          GetAllMessagePatientEvent.getAllMessage(),
        );
      },
      child: SingleChildScrollView(
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
                          _user?.image != null
                              ? showImageNetworkProfileUser(
                                imageUrl: _user!.image!,
                                width: 40.0,
                                height: 40.0,
                              )
                              : Image.asset(
                                Assets.images.doctorCircle.path,
                                width: 40.0,
                                height: 40.0,
                                fit: BoxFit.cover,
                              ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SpaceHeight(20),
                FilterTelemedisStatus(),
                const SpaceHeight(20),
                BlocBuilder<
                  GetAllMessagePatientBloc,
                  GetAllMessagePatientState
                >(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () => const SizedBox.shrink(),
                      loading:
                          () =>
                              const Center(child: CircularProgressIndicator()),
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
                          itemBuilder: (context, index) {
                            final message = messages[index].details;
                            return ListTile(
                              leading: CircleAvatar(
                                radius: 24.0,
                                backgroundImage:
                                    message.imageUrl != null
                                        ? NetworkImage(
                                          message.imageUrl!.contains("http")
                                              ? message.imageUrl!
                                              : dotenv.env['BASE_URL']! +
                                                  message.imageUrl!,
                                        )
                                        : AssetImage(
                                              Assets.images.doctorCircle.path,
                                            )
                                            as ImageProvider,
                              ),
                              title: Text(
                                message.name,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              subtitle: Text(
                                message.lastMessage ?? 'Start a conversation',
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              trailing: Text(
                                message.lastMessageTime
                                        ?.toString()
                                        .split(' ')[1]
                                        .substring(0, 5) ??
                                    "",
                                style: const TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.grey,
                                ),
                              ),
                              onTap: () {
                                context.push(
                                  RoomChatPage(
                                    chatRoomId: messages[index].id,
                                    doctorName: message.name,
                                    // lastMessageTime: DateFormat(
                                    //   'EEEE, d MMMM y',
                                    // ).format(message.lastMessageTime!),
                                    receiverId: message.id,
                                    senderId: _user?.id ?? 0,
                                  ),
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
      ),
    );
  }
}
