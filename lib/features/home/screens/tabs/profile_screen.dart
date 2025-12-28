import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fso/core/constants/colors.dart';
import 'package:fso/core/constants/literals.dart';
import 'package:fso/core/constants/spacings.dart';
import 'package:fso/core/widgets/button.dart';
import 'package:fso/features/authentication/bloc/bloc.dart';
import 'package:fso/features/profile/screens/change_password_screen.dart';
import 'package:fso/features/profile/screens/edit_profile_screen.dart';

import '../../../authentication/bloc/events.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kScaffoldColor,
      appBar: AppBar(
        backgroundColor: AppColors.kAppBarColor,
        title: const Text(
          'My Profile',
          style: TextStyle(
            fontFamily: 'DMSans',
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        titleSpacing: 24.0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        shape: const Border(
          bottom: BorderSide(
            width: 2.0,
            color: AppColors.kLightGreyColor,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                const SizedBox(height: 20.0),
                InkWell(
                  onTap: () {},
                  splashFactory: NoSplash.splashFactory,
                  highlightColor: Colors.transparent,
                  child: Padding(
                    padding: AppSpacings.horizontal,
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 24.0,
                          backgroundColor: AppColors.kPrimaryColor,
                          child: SvgPicture.asset(
                            AppLiterals.navIcon3,
                            width: 16.0,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 24.0),
                        const Text(
                          'Profile Photo',
                          style: TextStyle(
                            fontFamily: 'DMSans',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 20.0,
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(
                  height: 30.0,
                  color: AppColors.kLightGreyColor,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EditProfileScreen(),
                      ),
                    );
                  },
                  splashFactory: NoSplash.splashFactory,
                  highlightColor: Colors.transparent,
                  child: Padding(
                    padding: AppSpacings.horizontal,
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 24.0,
                          backgroundColor: AppColors.kPrimaryColor,
                          child: SvgPicture.asset(
                            AppLiterals.editProfileIcon,
                            width: 16.0,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 24.0),
                        const Text(
                          'Edit Profile',
                          style: TextStyle(
                            fontFamily: 'DMSans',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 20.0,
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(
                  height: 30.0,
                  color: AppColors.kLightGreyColor,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChangePasswordScreen(),
                      ),
                    );
                  },
                  splashFactory: NoSplash.splashFactory,
                  highlightColor: Colors.transparent,
                  child: Padding(
                    padding: AppSpacings.horizontal,
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 24.0,
                          backgroundColor: AppColors.kPrimaryColor,
                          child: SvgPicture.asset(
                            AppLiterals.passwordIcon,
                            width: 16.0,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 24.0),
                        const Text(
                          'Password',
                          style: TextStyle(
                            fontFamily: 'DMSans',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 20.0,
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(
                  height: 30.0,
                  color: AppColors.kLightGreyColor,
                ),
                InkWell(
                  onTap: () {},
                  splashFactory: NoSplash.splashFactory,
                  highlightColor: Colors.transparent,
                  child: const Padding(
                    padding: AppSpacings.horizontal,
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 24.0,
                          backgroundColor: AppColors.kPrimaryColor,
                          child: Icon(
                            Icons.phone_outlined,
                            size: 16.0,
                          ),
                        ),
                        SizedBox(width: 24.0),
                        Text(
                          'Contact Us',
                          style: TextStyle(
                            fontFamily: 'DMSans',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 20.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
            child: FSOButton(
              buttonText: 'Sign Out',
              backgroundColor: AppColors.kRedColor,
              textColor: Colors.white,
              onTap: () {
                print('OK');
                context
                    .read<AuthenticationBloc>()
                    .add(const AuthenticationLogoutEvent());
              },
            ),
          ),
        ],
      ),
    );
  }
}
