import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fso/core/constants/colors.dart';
import 'package:fso/core/constants/spacings.dart';
import 'package:fso/core/widgets/textfield.dart';

import '../../../core/widgets/button.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool _updating = false;
  final name = TextEditingController();
  final phone = [TextEditingController()];
  final email = TextEditingController();
  final whatsapp = TextEditingController();

  void addListener(TextEditingController controller) {
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void initState() {
    addListener(name);
    addListener(email);
    for (var phoneController in phone) {
      addListener(phoneController);
    }
    super.initState();
  }

  void updateData() async {
    setState(() {
      _updating = true;
    });

    final Map<String, dynamic> data = {};

    if (email.text.trim().isNotEmpty) {
      await FirebaseAuth.instance.currentUser!.updateEmail(email.text.trim());
      data['email'] = email.text.trim();
    }
    if (name.text.trim().isNotEmpty) {
      await FirebaseAuth.instance.currentUser!
          .updateDisplayName(name.text.trim());
      data['name'] = name.text.trim();
    }
    if (phone.isNotEmpty) {
      data['phone'] = phone.map((e) => e.text.trim()).toList();
    }

    if (data.isNotEmpty) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update(data);
    }

    email.clear();
    name.clear();
    phone.clear();
    whatsapp.clear();

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
            'Edit Profile',
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
                    FSOTextField(hintText: 'Full Name', controller: name),
                    const SizedBox(height: 24.0),
                    FSOTextField(hintText: 'Email', controller: email),
                    const SizedBox(height: 24.0),
                    FSOTextField(hintText: 'Whatsapp', controller: whatsapp),
                    const SizedBox(height: 24.0),
                    for (final phoneController in phone)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: FSOTextField(
                          hintText: 'Phone Number',
                          controller: phoneController,
                        ),
                      ),
                    const SizedBox(height: 24.0),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Material(
                        color: AppColors.kPrimaryColor,
                        borderRadius: BorderRadius.circular(10.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              phone.add(TextEditingController());
                            });
                          },
                          borderRadius: BorderRadius.circular(10.0),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 12.0),
                            child: Text(
                              '➕ Add More',
                              style: TextStyle(
                                fontFamily: 'DMSans',
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              FSOButton(
                buttonText: 'Save Changes',
                loading: _updating,
                disabled: email.text.trim().isEmpty &&
                    name.text.trim().isEmpty &&
                    phone.isEmpty,
                onTap: updateData,
              ),
              SizedBox(height: MediaQuery.of(context).viewPadding.bottom + 8.0),
            ],
          ),
        ),
      ),
    );
  }
}
