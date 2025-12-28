import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fso/core/constants/spacings.dart';
import 'package:fso/features/home/utils/input_data.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../core/constants/colors.dart';
import '../../../core/constants/enums.dart';

class ReviewSubmissionScreen extends StatelessWidget {
  final QueryDocumentSnapshot<Map<String, dynamic>> doc;
  const ReviewSubmissionScreen({
    super.key,
    required this.doc,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kScaffoldColor,
      appBar: AppBar(
        backgroundColor: AppColors.kAppBarColor,
        title: const Text(
          'Request Submitted',
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
      body: ListView(
        children: [
          Padding(
            padding: AppSpacings.horizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20.0),
                Text(
                  doc["subcategory"],
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
                  doc["category"],
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
                const SizedBox(height: 16.0),
                Text(
                  doc["notes"],
                  style: const TextStyle(
                    fontFamily: 'DMSans',
                    fontWeight: FontWeight.w400,
                    fontSize: 12.0,
                  ),
                ),
                const SizedBox(height: 40.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          timeago.format(
                              (doc["submitted_at"] as Timestamp).toDate()),
                          style: const TextStyle(
                            fontFamily: 'DMSans',
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                          ),
                        ),
                        const SizedBox(height: 2.0),
                        const Text(
                          'Submitted',
                          style: TextStyle(
                            fontFamily: 'DMSans',
                            fontWeight: FontWeight.w400,
                            fontSize: 9.0,
                            color: AppColors.kGreyColor,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14.0, vertical: 6.0),
                      decoration: BoxDecoration(
                        color: statustoColor[ServiceStatuses.values
                            .firstWhere((e) => e.name == doc["status"])],
                        borderRadius: BorderRadius.circular(99.0),
                      ),
                      child: Text(
                        ServiceStatuses.values
                            .firstWhere((e) => e.name == doc["status"])
                            .value,
                        style: TextStyle(
                          fontFamily: 'DMSans',
                          color: statusTextColor[ServiceStatuses.values
                              .firstWhere((e) => e.name == doc["status"])],
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(height: 72.0),
          ListView.builder(
            shrinkWrap: true,
            itemCount: doc["data"].length,
            physics: const NeverScrollableScrollPhysics(),
            padding: AppSpacings.horizontal,
            itemBuilder: (context, index) {
              final entry = doc['data'].entries.toList()[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 16.0,
                      backgroundColor: AppColors.kPrimaryAccentColor,
                      child: Icon(
                        Icons.arrow_forward_rounded,
                        color: AppColors.kPrimaryColor,
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          if (entry.key.contains('image_urls'))
                            Wrap(
                              spacing: 8.0,
                              runSpacing: 8.0,
                              children: List.generate(
                                entry.value.length,
                                (index) => InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Dialog(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            child: AspectRatio(
                                              aspectRatio: 1,
                                              child: CachedNetworkImage(
                                                imageUrl: entry.value[index],
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(4.0),
                                    child: CachedNetworkImage(
                                      imageUrl: entry.value[index],
                                      width: 72.0,
                                      height: 72.0,
                                      fit: BoxFit.cover,
                                      fadeInDuration: Duration.zero,
                                      fadeOutDuration: Duration.zero,
                                      placeholderFadeInDuration: Duration.zero,
                                      progressIndicatorBuilder:
                                          (context, url, progress) {
                                        if (progress.progress == null) {
                                          return const SizedBox();
                                        }
                                        return Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          color: Colors.grey.shade200,
                                          child: SizedBox(
                                            width: 48.0,
                                            height: 48.0,
                                            child: Center(
                                              child: CircularProgressIndicator(
                                                value: progress.progress,
                                                strokeWidth: 2.0,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            )
                          else
                            Text(
                              entry.value,
                              style: const TextStyle(
                                fontFamily: 'DMSans',
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                              ),
                            ),
                          const SizedBox(height: 2.0),
                          Text(
                            InputData.keyToLabel[entry.key] ?? '',
                            style: const TextStyle(
                              fontFamily: 'DMSans',
                              fontWeight: FontWeight.w500,
                              fontSize: 13.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
