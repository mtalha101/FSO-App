import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fso/core/constants/categories.dart';
import 'package:fso/core/constants/colors.dart';
import 'package:fso/core/constants/literals.dart';
import 'package:fso/core/constants/spacings.dart';

import '../../../request/screens/create_request_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        backgroundColor: AppColors.kScaffoldColor,
        body: ListView(
          padding: EdgeInsets.only(
            left: AppSpacings.horizontal.left,
            top: MediaQuery.of(context).viewPadding.top,
            right: AppSpacings.horizontal.right,
            bottom: MediaQuery.of(context).viewPadding.bottom,
          ),
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Welcome,',
                        style: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 12.0,
                        ),
                      ),
                      Text(
                        FirebaseAuth.instance.currentUser!.displayName ?? '',
                        style: const TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.notifications),
              ],
            ),
            const SizedBox(height: 12.0),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 0.0,
                    color: Color(0xFFF1F1EC),
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 0.0,
                    color: Color(0xFFF1F1EC),
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 0.0,
                    color: Color(0xFFF1F1EC),
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                fillColor: const Color(0xFFF1F1EC),
                filled: true,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 14.0, vertical: 12.0),
                prefixIcon: const Icon(
                  Icons.search_rounded,
                  size: 28.0,
                  color: Color(0xFFB7B7B7),
                ),
                hintText: 'Search',
                hintStyle: const TextStyle(
                  fontFamily: 'DMSans',
                  color: Color(0xFFB7B7B7),
                  fontSize: 15.0,
                ),
              ),
            ),
            const SizedBox(height: 24.0),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Categories',
                  style: TextStyle(
                    fontFamily: 'DMSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  'View All',
                  style: TextStyle(
                    fontFamily: 'DMSans',
                    fontWeight: FontWeight.w500,
                    fontSize: 11.0,
                    color: AppColors.kPrimaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24.0),
            ListView.builder(
              shrinkWrap: true,
              itemCount: ServiceCategory.categories.length,
              padding: EdgeInsets.zero,
              primary: false,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreateRequestScreen(
                              category: ServiceCategory.categories[index],
                            ),
                          ),
                        );
                      },
                      borderRadius: BorderRadius.circular(5.0),
                      child: Row(
                        children: [
                          Material(
                            color: AppColors.kPrimaryColor,
                            borderRadius: BorderRadius.circular(5.0),
                            child: const Padding(
                              padding: EdgeInsets.all(6.0),
                              child: Icon(
                                Icons.add_circle_outline_rounded,
                                color: Colors.black,
                                size: 32.0,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12.0),
                          Expanded(
                            child: Text(
                              ServiceCategory.categories[index],
                              style: const TextStyle(
                                fontFamily: 'DMSans',
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                height: 1,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 12.0),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CreateRequestScreen(),
              ),
            );
          },
          backgroundColor: AppColors.kPrimaryColor,
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 4.0, bottom: 4.0),
            child: SvgPicture.asset(
              AppLiterals.newRequest,
            ),
          ),
        ),
      ),
    );
  }
}
