import 'package:clinic_mobile_apps/data/datasources/auth_local_datasource.dart';
import 'package:clinic_mobile_apps/data/models/response/login_response_model.dart';
import 'package:clinic_mobile_apps/presentation/auth/pages/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:clinic_mobile_apps/core/assets/assets.gen.dart';
import 'package:clinic_mobile_apps/core/components/spaces.dart';
import 'package:clinic_mobile_apps/core/constants/colors.dart';
import 'package:clinic_mobile_apps/core/extensions/build_context_ext.dart';

class ProfileAdminPage extends StatefulWidget {
  const ProfileAdminPage({super.key});

  @override
  State<ProfileAdminPage> createState() => _ProfileAdminPageState();
}

class _ProfileAdminPageState extends State<ProfileAdminPage> {

  UserModel? _user;

  @override
  void initState() {
    _user = AuthLocalDatasource().getUserData()?.data?.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xff1469F0),
      statusBarBrightness: Brightness.dark,
    ));
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              height: 80,
              width: context.deviceWidth,
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.secondary,
                    Color(0xff1469F0),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          Assets.images.logoHorizontal.path,
                          width: 104.0,
                          height: 22.0,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SpaceHeight(14),
            Padding(
              padding: const EdgeInsets.all(
                20,
              ),
              child: Row(
                children: [
                  _user?.image != null
                      ? Image.network(_user!.image!)
                      : Image.asset(
                          Assets.images.klinik.path,
                          width: 72.0,
                          height: 72.0,
                          fit: BoxFit.cover,
                        ),
                  const SpaceWidth(
                    16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _user?.name ?? 'User',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        _user?.email ?? 'email@example.com',
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                          color: Color(
                            0xff8C8C8C,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SpaceHeight(
              12,
            ),
            _menuItem(Assets.icons.document.path, 'Kebijakan Layanan'),
            const SpaceHeight(16),
            _menuItem(Assets.icons.help.path, 'Bantuan'), const SpaceHeight(16),
            InkWell(
              onTap: () async {
                await AuthLocalDatasource().removeUserData();
                context.mounted
                    ? context.pushReplacement(OnboardingPage())
                    : null;
              },
              child: _menuItem(Assets.icons.logout.path, 'Keluar'),
            ),
            const SpaceHeight(16),
            // Padding(
            //   padding: EdgeInsets.only(top: context.deviceHeight * 0.2, left: 20, right: 20),
            //   child: EmptyWidget(),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _menuItem(final String image, final String title) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      padding: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: const Color(
              0xff677294,
            ).withOpacity(0.16),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
              color: Color(
                0xffF5F5F5,
              ),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Image.asset(
                image,
                width: 24.0,
                height: 24.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SpaceWidth(16),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              color: Color(
                0xff000000,
              ),
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios,
            size: 24,
            color: AppColors.primary,
          ),
        ],
      ),
    );
  }
}
