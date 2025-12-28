import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fso/core/constants/spacings.dart';
import 'package:fso/core/widgets/button.dart';
import 'package:fso/features/home/utils/input_data.dart';
import 'package:fso/features/home/widgets/input_field_displays.dart';

import '../../../core/constants/colors.dart';

class SubmitRequestScreen extends StatefulWidget {
  final String category;
  final String subCategory;
  final String notes;
  const SubmitRequestScreen({
    super.key,
    required this.category,
    required this.subCategory,
    required this.notes,
  });

  @override
  State<SubmitRequestScreen> createState() => _SubmitRequestScreenState();
}

class _SubmitRequestScreenState extends State<SubmitRequestScreen> {
  bool _submitting = false;
  final data = InputData();
  final _serviceCollection = FirebaseFirestore.instance.collection('services');

  void addListener(TextEditingController controller) {
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  initState() {
    super.initState();
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
            'Step 2 of 2',
            style: TextStyle(
              fontFamily: 'DMSans',
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          titleSpacing: 24.0,
          centerTitle: true,
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
                    const SizedBox(height: 20.0),
                    Text(
                      widget.subCategory,
                      style: const TextStyle(
                        fontFamily: 'DMSans',
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    const Text(
                      'Service Sub-Category',
                      style: TextStyle(
                        fontFamily: 'DMSans',
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                        color: AppColors.kGreyColor,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      widget.category,
                      style: const TextStyle(
                        fontFamily: 'DMSans',
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    const Text(
                      'Service Category',
                      style: TextStyle(
                        fontFamily: 'DMSans',
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                        color: AppColors.kGreyColor,
                      ),
                    ),
                    if (![
                      'Medical Services',
                      'Car Services',
                      'Mobile Services',
                      'Tourism Services'
                    ].contains(widget.category)) ...[
                      const SizedBox(height: 16.0),
                      const Text(
                        'Add the following details to collect your passport',
                        style: TextStyle(
                          fontFamily: 'DMSans',
                          fontWeight: FontWeight.w400,
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                    const SizedBox(height: 20.0),
                    InputBuilderWidget(
                      subCategory: widget.subCategory,
                      data: data,
                    ),
                  ],
                ),
              ),
              FSOButton(
                buttonText: 'Send Request',
                loading: _submitting,
                disabled: false,
                onTap: () async {
                  setState(() {
                    _submitting = true;
                  });

                  await uploadMedia(data);

                  _serviceCollection
                      .orderBy('request_id', descending: true)
                      .limit(1)
                      .get()
                      .then((value) {
                    final lastRequestId = value.docs.first['request_id'] as int;
                    _serviceCollection.add({
                      "category": widget.category,
                      "subcategory": widget.subCategory,
                      "notes": widget.notes,
                      "requested_by": FirebaseAuth.instance.currentUser!.uid,
                      "submitted_at": Timestamp.now(),
                      "status": "pending",
                      "request_id": lastRequestId + 1,
                      "data": data.populatedData(),
                    }).then((value) {
                      setState(() {
                        _submitting = false;
                      });
                      Navigator.of(context)
                        ..pop()
                        ..pop();
                    });
                  }).catchError((_) {
                    setState(() {
                      _submitting = false;
                    });
                  });
                },
              ),
              SizedBox(height: MediaQuery.of(context).viewPadding.bottom + 8.0),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> uploadMedia(InputData data) async {
    if (data.passportImages.isNotEmpty) {
      final imageUrls = <String>[];

      for (final image in data.passportImages) {
        final ref = FirebaseStorage.instance
            .ref()
            .child('services')
            .child('passport_images')
            .child('${DateTime.now().microsecondsSinceEpoch}');
        final uploadTask = await ref.putFile(image);
        final url = await uploadTask.ref.getDownloadURL();
        imageUrls.add(url);
      }

      if (imageUrls.isNotEmpty) {
        data.passportUrls = imageUrls;
      }
    }

    if (data.travelTicketImages.isNotEmpty) {
      final imageUrls = <String>[];

      for (final image in data.travelTicketImages) {
        final ref = FirebaseStorage.instance
            .ref()
            .child('services')
            .child('travel_ticket_images')
            .child('${DateTime.now().microsecondsSinceEpoch}');
        final uploadTask = await ref.putFile(image);
        final url = await uploadTask.ref.getDownloadURL();
        imageUrls.add(url);
      }

      if (imageUrls.isNotEmpty) {
        data.travelTicketUrls = imageUrls;
      }
    }

    if (data.medicalReportImages.isNotEmpty) {
      final imageUrls = <String>[];

      for (final image in data.medicalReportImages) {
        final ref = FirebaseStorage.instance
            .ref()
            .child('services')
            .child('medical_report_images')
            .child('${DateTime.now().microsecondsSinceEpoch}');
        final uploadTask = await ref.putFile(image);
        final url = await uploadTask.ref.getDownloadURL();
        imageUrls.add(url);
      }

      if (imageUrls.isNotEmpty) {
        data.medicalReportUrls = imageUrls;
      }
    }

    if (data.drivingLicensesImages.isNotEmpty) {
      final imageUrls = <String>[];

      for (final image in data.drivingLicensesImages) {
        final ref = FirebaseStorage.instance
            .ref()
            .child('services')
            .child('driving_licenses_images')
            .child('${DateTime.now().microsecondsSinceEpoch}');
        final uploadTask = await ref.putFile(image);
        final url = await uploadTask.ref.getDownloadURL();
        imageUrls.add(url);
      }

      if (imageUrls.isNotEmpty) {
        data.drivingLicensesUrls = imageUrls;
      }
    }

    if (data.personalPhotoImages.isNotEmpty) {
      final imageUrls = <String>[];

      for (final image in data.personalPhotoImages) {
        final ref = FirebaseStorage.instance
            .ref()
            .child('services')
            .child('personal_photo_images')
            .child('${DateTime.now().microsecondsSinceEpoch}');
        final uploadTask = await ref.putFile(image);
        final url = await uploadTask.ref.getDownloadURL();
        imageUrls.add(url);
      }

      if (imageUrls.isNotEmpty) {
        data.personalPhotoUrls = imageUrls;
      }
    }

    if (data.carLicenseImages.isNotEmpty) {
      final imageUrls = <String>[];

      for (final image in data.carLicenseImages) {
        final ref = FirebaseStorage.instance
            .ref()
            .child('services')
            .child('car_license_images')
            .child('${DateTime.now().microsecondsSinceEpoch}');
        final uploadTask = await ref.putFile(image);
        final url = await uploadTask.ref.getDownloadURL();
        imageUrls.add(url);
      }

      if (imageUrls.isNotEmpty) {
        data.carLicenseUrls = imageUrls;
      }
    }
  }
}
