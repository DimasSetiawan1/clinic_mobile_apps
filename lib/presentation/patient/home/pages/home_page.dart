import 'dart:developer';

import 'package:clinic_mobile_apps/core/shared/cubits/stack_navigation_cubit.dart';
import 'package:clinic_mobile_apps/data/datasources/auth_local_datasource.dart';
import 'package:clinic_mobile_apps/presentation/patient/doctors/doctors_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:clinic_mobile_apps/core/assets/assets.gen.dart';
import 'package:clinic_mobile_apps/core/constants/colors.dart';
import 'package:clinic_mobile_apps/presentation/patient/chat/pages/chat_page.dart';
import 'package:clinic_mobile_apps/presentation/patient/history/pages/history_page.dart';
import 'package:clinic_mobile_apps/presentation/patient/home/widgets/nav_item.dart';
import 'package:clinic_mobile_apps/presentation/patient/profile/pages/profile_page.dart';
import 'package:clinic_mobile_apps/presentation/patient/telemedis/pages/telemedis_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class HomePage extends StatefulWidget {
  final int initialIndex;
  const HomePage({super.key, this.initialIndex = 0});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const DoctorsPage(),
    const TelemedisPage(),
    const ChatPage(isDoctor: false),
    const HistoryPage(),
    const ProfilePage(),
  ];

  @override
  void initState() {
    _selectedIndex = widget.initialIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: SafeArea(
        child: BlocBuilder<StackNavigationCubit, int>(
          builder: (context, state) {
            _selectedIndex = state;
            return IndexedStack(index: _selectedIndex, children: _pages);
          },
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -2),
              blurRadius: 30.0,
              blurStyle: BlurStyle.outer,
              spreadRadius: 0,
              color: Colors.black.withOpacity(0.08),
            ),
          ],
        ),
        child: BlocBuilder<StackNavigationCubit, int>(
          builder: (context, state) {
            _selectedIndex = state;
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NavItem(
                  iconPath: Assets.icons.profileCircle.path,
                  label: 'Doctors',
                  isActive: _selectedIndex == 0,
                  onTap: () {
                    context.read<StackNavigationCubit>().setIndex(0);
                  },
                ),
                NavItem(
                  iconPath: Assets.icons.telemedis.path,
                  label: 'Telemedis',
                  isActive: _selectedIndex == 1,
                  onTap: () {
                    context.read<StackNavigationCubit>().setIndex(1);
                  },
                ),
                NavItem(
                  iconPath: Assets.icons.chat.path,
                  label: 'Chat',
                  isActive: _selectedIndex == 2,
                  onTap: () => context.read<StackNavigationCubit>().setIndex(2),
                ),
                NavItem(
                  iconPath: Assets.icons.note.path,
                  label: 'History',
                  isActive: _selectedIndex == 3,
                  onTap: () => context.read<StackNavigationCubit>().setIndex(3),
                ),
                NavItem(
                  iconPath: Assets.icons.profileCircle.path,
                  label: 'Profile',
                  isActive: _selectedIndex == 4,
                  onTap: () => context.read<StackNavigationCubit>().setIndex(4),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
