import 'package:clinic_mobile_apps/data/models/request/chat_request_model.dart';
import 'package:clinic_mobile_apps/presentation/patient/chat/blocs/chat_room/chat_room_bloc.dart';
import 'package:clinic_mobile_apps/presentation/patient/chat/cubits/validation_message_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:clinic_mobile_apps/core/assets/assets.gen.dart';
import 'package:clinic_mobile_apps/core/components/widgets/spaces.dart';
import 'package:clinic_mobile_apps/core/constants/colors.dart';
import 'package:clinic_mobile_apps/core/extensions/build_context_ext.dart';
import 'package:clinic_mobile_apps/presentation/patient/chat/widgets/chat_bubble.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class RoomChatPage extends StatefulWidget {
  final String chatRoomId;
  final bool? isDoctor;
  final int senderId;
  final int receiverId;
  final String? doctorName;
  final String? patientName;
  const RoomChatPage({
    super.key,
    required this.chatRoomId,
    required this.senderId,
    required this.receiverId,
    this.doctorName,
    this.isDoctor,
    this.patientName,
  });

  @override
  State<RoomChatPage> createState() => _RoomChatPageState();
}

class _RoomChatPageState extends State<RoomChatPage> {
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    context.read<ChatRoomBloc>().add(ChatRoomEvent.watch(widget.chatRoomId));
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
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  // SpaceWidth(context.deviceWidth * 0.1),
                  CircleAvatar(
                    backgroundColor: AppColors.gray,
                    child: Image.asset(
                      Assets.images.doctor1.path,
                      width: 30.0,
                      height: 30.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SpaceWidth(8),
                  Text(
                    widget.doctorName ?? "Doctor",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SpaceHeight(12),
            Expanded(
              child: BlocBuilder<ChatRoomBloc, ChatRoomState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () => const SizedBox.shrink(),
                    // loading:
                    //     () => const Center(child: CircularProgressIndicator()),
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
                      final chats = messages.reversed.toList();
                      return ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        itemCount: chats.length,
                        itemBuilder: (context, index) {
                          final message = chats[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: ChatBubble(
                              direction:
                                  message.senderId == widget.senderId
                                      ? Direction.right
                                      : Direction.left,
                              message: message.message,
                              type: BubbleType.top,
                              clock: DateFormat(
                                'HH:mm',
                              ).format(message.timestamp),
                            ),
                          );
                        },
                      );
                    },
                    failed:
                        (error) => Center(
                          child: Text(
                            error,
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: Colors.red,
                            ),
                          ),
                        ),
                  );
                },
              ),
            ),
            SizedBox(
              width: context.deviceWidth,
              height: 80.0,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 234, 242, 242),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.isEmpty) {
                                  context
                                      .read<ValidationMessageCubit>()
                                      .setNotValid();
                                } else {
                                  context
                                      .read<ValidationMessageCubit>()
                                      .setValid();
                                }
                              },
                              controller: _messageController,
                              decoration: InputDecoration(
                                hintText: "Type a message",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          BlocBuilder<
                            ValidationMessageCubit,
                            ValidationMessageState
                          >(
                            builder: (context, state) {
                              return GestureDetector(
                                onTap: () {
                                  if (state == ValidationMessageState.valid) {
                                    context.read<ChatRoomBloc>().add(
                                      ChatRoomEvent.sendMessage(
                                        widget.chatRoomId,
                                        ChatRequestModel(
                                          senderId: widget.senderId,
                                          reciverId: widget.receiverId,
                                          timestamp: DateTime.now(),
                                          message:
                                              _messageController.text.trim(),
                                        ),
                                        widget.senderId,
                                        widget.receiverId,
                                        widget.isDoctor != null
                                            ? widget.doctorName ?? "Doctor"
                                            : widget.patientName ?? "Patient",
                                        // widget.isDoctor ?? false,
                                      ),
                                    );
                                    _messageController.clear();
                                  }
                                },
                                child: Icon(
                                  state == ValidationMessageState.valid
                                      ? Icons.send
                                      : Icons.send,
                                  color:
                                      state == ValidationMessageState.valid
                                          ? AppColors.primary
                                          : Colors.grey,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SpaceWidth(16),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(Icons.camera_alt),
                  ),
                  const SpaceWidth(16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
