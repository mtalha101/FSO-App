import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fso/core/constants/colors.dart';
import 'package:fso/core/extensions/string.dart';
import 'package:fso/features/request/screens/review_submission_screen.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../core/constants/enums.dart';

class ServiceWidget extends StatelessWidget {
  final String category;
  final String subcategory;
  final String notes;
  final String status;
  final DateTime submittedAt;
  final QueryDocumentSnapshot<Map<String, dynamic>> doc;
  const ServiceWidget({
    super.key,
    required this.category,
    required this.subcategory,
    required this.notes,
    required this.status,
    required this.submittedAt,
    required this.doc,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ReviewSubmissionScreen(doc: doc),
            ),
          );
        },
        borderRadius: BorderRadius.circular(15.0),
        child: Ink(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: AppColors.kSecondaryColor,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                '$category - $subcategory',
                style: const TextStyle(
                  fontFamily: 'DMSans',
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8.0),
              Text(
                notes,
                style: const TextStyle(
                  fontFamily: 'DMSans',
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  color: AppColors.kSecondaryTextColor,
                ),
              ),
              const SizedBox(height: 12.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 6.0),
                    decoration: BoxDecoration(
                      color: statustoColor[ServiceStatuses.values.firstWhere((e) => e.name == status)],
                      borderRadius: BorderRadius.circular(99.0),
                    ),
                    child: Text(
                      ServiceStatuses.values.firstWhere((e) => e.name == status).value,
                      style: TextStyle(
                        fontFamily: 'DMSans',
                        color: statusTextColor[ServiceStatuses.values.firstWhere((e) => e.name == status)],
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                  Text(
                    "${timeago.format(submittedAt, locale: 'en_short')} ago",
                    style: const TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
