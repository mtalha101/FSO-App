import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fso/core/constants/colors.dart';
import 'package:fso/core/constants/spacings.dart';
import 'package:fso/core/widgets/textfield.dart';

import '../../../core/widgets/button.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool _updating = false;
  final oldPass = TextEditingController();
  final newPass = TextEditingController();
  final confirmPass = TextEditingController();

  void addListener(TextEditingController controller) {
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void initState() {
    addListener(oldPass);
    addListener(newPass);
    addListener(confirmPass);
    super.initState();
  }

  void updatePass() async {
    setState(() {
      _updating = true;
    });

    final user = FirebaseAuth.instance.currentUser!;
    final credential = EmailAuthProvider.credential(email: user.email!, password: oldPass.text);
    try {
      await user.reauthenticateWithCredential(credential);
    } on FirebaseAuthException {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: AppColors.kRedColor,
          content: Text(
            'Old password is incorrect',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      );

      setState(() {
        _updating = false;
      });

      return;
    }

    if (newPass.text != confirmPass.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: AppColors.kRedColor,
          content: Text(
            'New passwords don\'t match',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      );

      setState(() {
        _updating = false;
      });

      return;
    }

    await user.updatePassword(newPass.text);

    oldPass.clear();
    newPass.clear();
    confirmPass.clear();

    setState(() {
      _updating = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        backgroundColor: AppColors.kScaffoldColor,
        appBar: AppBar(
          backgroundColor: AppColors.kAppBarColor,
          title: const Text(
            'Change Password',
            style: TextStyle(
              fontFamily: 'DMSans',
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          titleSpacing: 24.0,
          centerTitle: false,
          shape: const Border(
            bottom: BorderSide(
              width: 2.0,
              color: AppColors.kLightGreyColor,
            ),
          ),
        ),
        body: Padding(
          padding: AppSpacings.horizontal,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    const SizedBox(height: 32.0),
                    FSOTextField(hintText: 'Old Password', controller: oldPass),
                    const SizedBox(height: 24.0),
                    FSOTextField(hintText: 'New Password', controller: newPass),
                    const SizedBox(height: 24.0),
                    FSOTextField(hintText: 'Confirm New Password', controller: confirmPass),
                  ],
                ),
              ),
              FSOButton(
                buttonText: 'Save Changes',
                loading: _updating,
                disabled: oldPass.text.isEmpty || newPass.text.isEmpty || confirmPass.text.isEmpty,
                onTap: updatePass,
              ),
              SizedBox(height: MediaQuery.of(context).viewPadding.bottom + 8.0),
            ],
          ),
        ),
      ),
    );
  }
}
