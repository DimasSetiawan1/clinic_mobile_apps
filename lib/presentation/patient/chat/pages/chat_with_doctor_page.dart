import 'dart:developer';

import 'package:clinic_mobile_apps/data/datasources/firebase_datasource.dart';
import 'package:clinic_mobile_apps/data/datasources/onesignal_notification_datasource.dart';
import 'package:clinic_mobile_apps/data/models/request/chat_request_model.dart';
import 'package:clinic_mobile_apps/data/models/response/orders_response_model.dart';
import 'package:clinic_mobile_apps/presentation/patient/chat/pages/room_chat_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:clinic_mobile_apps/core/components/buttons.dart';
import 'package:clinic_mobile_apps/core/components/custom_text_field.dart';
import 'package:clinic_mobile_apps/core/components/custom_text_field_height.dart';
import 'package:clinic_mobile_apps/core/components/spaces.dart';
import 'package:clinic_mobile_apps/core/constants/colors.dart';
import 'package:clinic_mobile_apps/core/extensions/build_context_ext.dart';
import 'package:clinic_mobile_apps/presentation/patient/chat/pages/chat_list_page.dart';

class ChatWithDoctorPage extends StatefulWidget {
  final String? name;
  final ChatRooms? chatRoom;
  const ChatWithDoctorPage({super.key, this.name, this.chatRoom});

  @override
  State<ChatWithDoctorPage> createState() => _ChatWithDoctorPageState();
}

class _ChatWithDoctorPageState extends State<ChatWithDoctorPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _chatController = TextEditingController();

  @override
  void initState() {
    if (widget.name != null) {
      _nameController.text = widget.name!;
    }
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

    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              width: context.deviceWidth,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.secondary, Color(0xff1469F0)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.white,
                    ),
                  ),
                  SpaceWidth(context.deviceWidth * 0.1),
                  const Text(
                    "Chat bersama Dokter",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SpaceHeight(32),
            Container(
              margin: const EdgeInsets.all(20.0),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
              width: context.deviceWidth,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x19000000),
                    blurRadius: 24,
                    offset: Offset(0, 11),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Pasien",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  const SpaceHeight(8),
                  CustomTextField(controller: _nameController, label: ''),
                  const SpaceHeight(20),
                  const Text(
                    "Pertanyaan",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  const SpaceHeight(8),
                  CustomTextFieldHeight(
                    controller: _chatController,
                    label: 'Tulis Pertanyaan Anda',
                  ),
                  const SpaceHeight(20),
                  const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text:
                              'Dengan menfirimi peprtanyaan, Anda menyetujui ',
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: 'kebijakan privasi',
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primary,
                          ),
                        ),
                        TextSpan(
                          text: ' dan ',
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: 'ketentuan layanan',
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primary,
                          ),
                        ),
                        TextSpan(
                          text: ' aplikasi “Ayo Sehat”.',
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SpaceHeight(20),
                  Button.filled(
                    onPressed: () async {
                      // context.push(const ChatListPage());
                      if (_nameController.text.isEmpty ||
                          _chatController.text.isEmpty) {
                        context.showSnackBar(
                          "Nama dan pertanyaan tidak boleh kosong",
                        );
                        return;
                      }
                      final chatRoomRef = FirebaseDatasource()
                          .chatRoomsCollection
                          .doc(widget.chatRoom?.id ?? '');
                      final docSnapshot = await chatRoomRef.get();

                      if (!docSnapshot.exists) {
                        await chatRoomRef.set({
                          'chat_room_name': _nameController.text,
                          'last_message': _chatController.text,
                          'last_message_time': DateTime.now().toIso8601String(),
                          'participants': [
                            widget.chatRoom?.doctorsId,
                            widget.chatRoom?.usersId,
                          ],
                        });
                      }
                      await chatRoomRef.update(
                        ChatRequestModel(
                          lastMessage: _chatController.text,
                          lastMessageTime: DateTime.now().toIso8601String(),
                          messages: Messages(
                            senderId: widget.chatRoom?.usersId,
                            reciverId: widget.chatRoom?.doctorsId,
                            message: _chatController.text,
                            timestamp: DateTime.now().toIso8601String(),
                          ),
                        ).toJson(),
                      );
                      if (context.mounted) {
                        context.showSnackBar("Pesan berhasil dikirim!");
                        OnesignalNotificationDatasource().sendNotification(
                          _chatController.text,
                          widget.chatRoom!.doctorsId,
                          widget.chatRoom!.usersId,
                        );
                        _chatController.clear();
                        _nameController.clear();
                        context.pushReplacement(
                          RoomChatPage(
                            chatRoom: widget.chatRoom,
                            name: _nameController.text,
                          ),
                        );
                      }
                    },
                    label: 'Kirim Pertanyaan',
                    color: AppColors.primary,
                    height: 48,
                    borderRadius: 8,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
