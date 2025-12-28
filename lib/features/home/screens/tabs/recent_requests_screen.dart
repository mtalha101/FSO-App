import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fso/core/constants/colors.dart';
import 'package:fso/core/constants/literals.dart';
import 'package:fso/core/constants/spacings.dart';
import 'package:fso/features/home/widgets/service_widget.dart';

class RecentRequestsScreen extends StatelessWidget {
  const RecentRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kScaffoldColor,
      appBar: AppBar(
        backgroundColor: AppColors.kAppBarColor,
        title: const Text(
          'Recent Requests',
          style: TextStyle(
            fontFamily: 'DMSans',
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        titleSpacing: 24.0,
        actions: [
          SvgPicture.asset(
            AppLiterals.cartIcon,
          ),
          const SizedBox(width: 24.0),
        ],
        centerTitle: false,
        automaticallyImplyLeading: false,
        shape: const Border(
          bottom: BorderSide(
            width: 2.0,
            color: AppColors.kLightGreyColor,
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          const SizedBox(height: 16.0),
          StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance
                .collection('services')
                .where('requested_by', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                .orderBy('submitted_at', descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const SizedBox();

              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                primary: false,
                itemCount: snapshot.data!.docs.length,
                padding: AppSpacings.horizontal,
                itemBuilder: (context, index) {
                  final request = snapshot.data!.docs[index];

                  return ServiceWidget(
                    category: request["category"],
                    subcategory: request["subcategory"],
                    notes: request["notes"],
                    status: request["status"],
                    submittedAt: (request["submitted_at"] as Timestamp).toDate(),
                    doc: request,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
